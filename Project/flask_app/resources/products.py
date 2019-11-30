from flask_restful import Resource, reqparse
from flask_jwt_extended import jwt_required, get_jwt_identity
from extensions import mysql
from common.scrapers import make_scrapper
from common.utils import (error_resp, add_comment, get_comment,
                          update_desired_price)
from pymysql.err import OperationalError

product_parser = reqparse.RequestParser()
product_parser.add_argument(
    "url", help="url field required", required=True)
product_parser.add_argument(
    "price", help="price field required", default=None, type=float
)


class TrackProduct(Resource):
    update_parser = reqparse.RequestParser()
    update_parser.add_argument('retailer', required=True,
                               help='retailer field required')
    update_parser.add_argument('product_id', required=True,
                               help='product_id required')
    update_parser.add_argument('price', required=True,
                               help='price field required',
                               type=float)

    @jwt_required
    def get(self):
        current_user = get_jwt_identity()
        try:
            cursor = mysql.get_db().cursor()
            sql = '''
            SELECT name, url, price, desired_price, product.retailer
            FROM product JOIN product_tracked_by_user
            ON product.product_id = product_tracked_by_user.product_id 
            and product.retailer = product_tracked_by_user.retailer
            WHERE user_id=%s
            '''
        except OperationalError as e:
            return error_resp(e)

        cursor.execute(sql, (current_user,))

        results = cursor.fetchall()
        resp = []
        if not results:
            return resp
        for result in results:
            name, url, price, desired_price, retailer = result
            temp = {'retailer': retailer,
                    'title': name,
                    'url': url,
                    'price': price, 'desired_price': desired_price}
            resp.append(temp)

        return resp

    @jwt_required
    def post(self):
        args = product_parser.parse_args()
        current_user_id = get_jwt_identity()
        url = args['url']
        is_new = False  # flag if product is not already in db

        scraper = make_scrapper(url)
        if not scraper:
            return error_resp('url not supported', 400)

        retailer = scraper.retailer
        product_id = scraper.get_id_from_url()

        cursor = mysql.get_db().cursor()

        # check if product already exists and being tracked
        sql = '''
        SELECT user_id, product_id, retailer
        FROM product_tracked_by_user
        WHERE product_id=%s and user_id=%s and retailer=%s
        '''
        cursor.execute(sql, (product_id, current_user_id, retailer))
        if cursor.fetchone():
            return {'message': 'Product already tracked'}

        # check if product already stored in DB
        sql = '''
        SELECT price, name, url FROM product 
        WHERE product_id=%s and retailer=%s'''
        cursor.execute(sql, (product_id, retailer))
        result = cursor.fetchone()
        if not result:
            is_new = True
            # add product to db
            scraper.scrape()
            price = scraper.price
            product_id = scraper.product_id
            title = scraper.title
            min_url = scraper.minimal_url

            if None in (price, product_id, title, min_url):
                return {
                           'message': 'unable to obtain necessary product info'}, 422

            sql = '''
            INSERT INTO product (name, url, price, product_id, retailer) 
            VALUES (%s, %s, %s, %s, %s)
            '''
            cursor.execute(sql, (title, min_url, price, product_id, retailer))
        else:
            price, title, min_url = result

        desired_price = args.get('price', price * 0.9)

        # add product to user's track list
        sql = '''
        INSERT INTO product_tracked_by_user 
        (product_id, retailer, user_id, desired_price)
        VALUES (%s, %s, %s, %s)
        '''
        cursor.execute(sql,
                       (product_id, retailer, current_user_id, desired_price))
        mysql.get_db().commit()
        code = 201 if is_new else 200
        return {'message': 'product added to tracking',
                'title': title,
                'price': price,
                'link': min_url,
                'new_item': is_new}, code

    @jwt_required
    def put(self):
        args = self.update_parser.parse_args()
        user = get_jwt_identity()
        db_con = mysql.get_db()
        retailer = args['retailer']
        product_id = args['product_id']
        price = args['price']

        resp = update_desired_price(db_con, user, retailer, product_id, price)
        return resp


class NewComments(Resource):
    comments_parser = reqparse.RequestParser()
    comments_parser.add_argument('comment', help='comment field required',
                                 required=True)
    comments_parser.add_argument('retailer')
    comments_parser.add_argument('product_id')

    @jwt_required
    def post(self):
        args = self.comments_parser.parse_args()
        current_user = get_jwt_identity()
        retailer = args['retailer']
        product_id = args['product_id']
        comment = args['comment']

        db = mysql.get_db()
        resp = add_comment(db, current_user, retailer, product_id, comment)
        return resp


class GetComments(Resource):
    def get(self, retailer, prod_id):
        db = mysql.get_db()
        return get_comment(db, retailer, prod_id)
