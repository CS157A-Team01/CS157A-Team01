from flask_restful import Resource
from flask_jwt_extended import jwt_required, get_jwt_identity
from extensions import mysql


class GetUserInfo(Resource):
    @jwt_required
    def get(self):
        current_user = get_jwt_identity()
        cursor = mysql.get_db().cursor()

        sql = f"SELECT * FROM user WHERE id = {int(current_user)}"
        cursor.execute(sql)
        _, username, password, primary_email_id = cursor.fetchone()

        sql = "SELECT * FROM email WHERE id = %s"
        cursor.execute(sql, (primary_email_id,))
        try:
            _, address, _ = cursor.fetchone()
        except TypeError:
            address = 'No primary email, fix this'

        return {'username': username, 'primary email': address}
