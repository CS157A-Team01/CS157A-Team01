from flask_restful import Resource, reqparse
from flask import redirect, abort
from flask_jwt_extended import jwt_required, get_jwt_identity
from extensions import mysql
from pymysql.err import OperationalError
from common.utils import error_resp, add_email


class UpdateUserInfo(Resource):
    options = {'email', 'password', 'username'}

    email_parser = reqparse.RequestParser()
    email_parser.add_argument('new_email',
                              required=True,
                              help='new email field is required')

    def valid_option(self, option):
        return option in self.options

    @jwt_required
    def post(self, option):
        if not self.valid_option(option):
            return redirect('/')
        # only email can be POST
        if option != 'email':
            abort(405)
        current_user = get_jwt_identity()
        args = self.email_parser.parse_args()
        new_email = args['new_email']
        try:
            db = mysql.get_db()
        except OperationalError:
            return abort(500)

        return add_email(db, new_email, current_user)

    @jwt_required
    def put(self, option):
        pass


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
