from flask_restful import Resource
from flask_jwt_extended import jwt_required, get_jwt_identity
from extensions import mysql
from pymysql.err import OperationalError
from common.utils import error_resp


class GetUserInfo(Resource):
    @jwt_required
    def get(self):
        current_user = get_jwt_identity()
        try:
            cursor = mysql.get_db().cursor()

            sql = '''
            SELECT username, password, address FROM email 
            JOIN user_primary_email
            ON email.user_id = user_primary_email.user_id
            JOIN user 
            ON email.user_id = user.id
            WHERE user.id = %s
            '''
            cursor.execute(sql, (current_user,))
        except OperationalError as e:
            return error_resp(e)

        username, password, address = cursor.fetchone()

        return {'username': username,
                'primary_email': address,
                'hashed_password': password.decode('utf-8')}
