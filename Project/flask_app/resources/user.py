from flask_restful import Resource
from flask_jwt_extended import jwt_required, get_jwt_identity
from extensions import mysql


class GetUserInfo(Resource):
    @jwt_required
    def get(self):
        current_user = get_jwt_identity()
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
        username, password, address = cursor.fetchone()

        return {'username': username,
                'primary email': address,
                'hashed password': password.decode('utf-8')}
