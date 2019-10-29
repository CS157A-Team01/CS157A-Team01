from flask_restful import Resource, reqparse
from flask_jwt_extended import jwt_required, get_jwt_identity
from extensions import mysql
from common.scrapers import AmazonScraper
from common.utils import which_retailer, error_resp
from pymysql.err import OperationalError

product_parser = reqparse.RequestParser()
product_parser.add_argument(
    "url", help="url field required", required=True)
product_parser.add_argument(
    "price", help="price field required", default=None, type=float
)


class TrackProduct(Resource):
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
        retailer = which_retailer(url)
        scraper = None
        is_new = False  # flag if product is not already in db

        if not retailer:
            return {'message': 'link not supported'}, 400
        if retailer == 'amazon':
            scraper = AmazonScraper(url)

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
                return {'message': 'unable to obtain necessary product info'}, 422

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
