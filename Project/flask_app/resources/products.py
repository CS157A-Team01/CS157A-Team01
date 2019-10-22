from flask_restful import Resource, reqparse
from flask_jwt_extended import jwt_required, get_jwt_identity
from extensions import mysql
from common.scrapers import AmazonScraper
from common.utils import which_retailer

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
        cursor = mysql.get_db().cursor()
        sql = '''
        SELECT name, url, price, desired_price, product.retailer
        FROM product JOIN product_tracked_by_user
        ON product.product_id = product_tracked_by_user.product_id 
        and product.retailer = product_tracked_by_user.retailer
        WHERE user_id=%s
        '''
        cursor.execute(sql, (current_user,))

        results = cursor.fetchall()
        if not results:
            return {'message': 'No product currently being tracked'}

        resp = []
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
        scrapper = None
        if not retailer:
            return {'message': 'link not supported'}, 400
        if retailer == 'amazon':
            scrapper = AmazonScraper(url)

        scrapper.scrape()

        price = scrapper.price
        product_id = scrapper.product_id
        title = scrapper.title
        min_url = scrapper.minimal_url

        if None in (price, product_id, title, min_url):
            return {'message': 'unable to obtain necessary product info'}, 422

        desired_price = args.get('price', price * 0.9)
        cursor = mysql.get_db().cursor()

        sql = '''
        SELECT user_id, product_id, retailer
        FROM product_tracked_by_user
        WHERE product_id=%s and user_id=%s and retailer=%s
        '''
        cursor.execute(sql, (product_id, current_user_id, retailer))

        if cursor.fetchone():
            return {'message': 'Product already tracked'}

        sql = '''
        SELECT name FROM product WHERE retailer=%s and product_id=%s
        '''
        cursor.execute(sql, (retailer, product_id))
        if not cursor.fetchone():
            sql = '''
            INSERT INTO product (name, url, price, product_id, retailer) 
            VALUES (%s, %s, %s, %s, %s)
            '''
            cursor.execute(sql, (title, min_url, price, product_id, retailer))
        sql = '''
        UPDATE product SET price=%s
        WHERE product_id=%s and retailer=%s
        '''
        cursor.execute(sql, (price, product_id, retailer))

        sql = '''
        INSERT INTO product_tracked_by_user 
        (product_id, retailer, user_id, desired_price)
        VALUES (%s, %s, %s, %s)
        '''
        cursor.execute(sql,
                       (product_id, retailer, current_user_id, desired_price))
        mysql.get_db().commit()
        return {'message': 'product added to tracking'}
