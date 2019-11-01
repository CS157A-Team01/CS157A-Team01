from flask_restful import Resource, reqparse
from flask import redirect, abort
from flask_jwt_extended import jwt_required, get_jwt_identity
from extensions import mysql
from pymysql.err import OperationalError
from common.utils import (error_resp, add_email, change_password,
                          change_username, delete_email)


class UpdateUserInfo(Resource):
    options = {'email', 'password', 'username'}

    email_parser = reqparse.RequestParser()
    email_parser.add_argument('email',
                              required=True,
                              help='email field is required')

    new_pass_parser = reqparse.RequestParser()
    new_pass_parser.add_argument('new_password',
                                 help='new_password field required',
                                 required=True)

    new_username_parser = reqparse.RequestParser()
    new_username_parser.add_argument('new_username',
                                     help='new_username field required',
                                     required=True)

    def valid_option(self, option):
        return option in self.options

    def _get_db_conn(self):
        try:
            return mysql.get_db()
        except OperationalError as e:
            print(e)
            return abort(500)

    @jwt_required
    def post(self, option):
        """
        Add new email to current user
        :param option:
        :return:
        """

        if not self.valid_option(option):
            return redirect('/')
        # only email can be POST
        if option != 'email':
            return abort(405)

        db = self._get_db_conn()
        current_user = get_jwt_identity()
        args = self.email_parser.parse_args()
        new_email = args['email']
        return add_email(db, current_user, new_email)

    @jwt_required
    def delete(self, option):
        """
        Delete an email from current user
        :param option:
        :return: response
        """

        if not self.valid_option(option):
            return redirect('/')

        if option != 'email':
            return abort(405)

        db = self._get_db_conn()
        current_user = get_jwt_identity()
        email = self.email_parser.parse_args()['email']
        return delete_email(db, current_user, email)

    @jwt_required
    def put(self, option):
        """
        For updating user's info
        :param option:
        :return: Response
        """

        if not self.valid_option(option):
            return redirect('/')
        current_user = get_jwt_identity()
        db = self._get_db_conn()

        if option == 'password':
            args = self.new_pass_parser.parse_args()
            return change_password(db, current_user, args['new_password'])
        elif option == 'username':
            args = self.new_username_parser.parse_args()
            return change_username(db, current_user, args['new_username'])

        return abort(405)


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
            username, password, address = cursor.fetchone()

            sql = '''
            SELECT address, confirmed FROM email
            WHERE user_id = %s
            '''
            cursor.execute(sql, (current_user,))
            emails = cursor.fetchall()
        except OperationalError as e:
            return error_resp(e)

        email_list = [{'email': email, 'confirmed': bool(confirmed)}
                      for email, confirmed in emails]

        return {'username': username,
                'primary_email': address,
                'all_email': email_list,
                'hashed_password': password.decode('utf-8')}
