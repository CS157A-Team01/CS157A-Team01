from flask_restful import Resource, reqparse
from model import temp_blacklist
from extensions import bcrypt, mysql
from flask import request, jsonify, abort
from pymysql.err import OperationalError
from flask_jwt_extended import (create_access_token, create_refresh_token,
                                get_jwt_identity, jwt_refresh_token_required,
                                jwt_required, get_raw_jwt, set_access_cookies,
                                set_refresh_cookies, unset_jwt_cookies)
from common.utils import (validate_registration, send_confirmation_email,
                          generate_email_token, error_resp, username_exists,
                          email_exists)

register_parser = reqparse.RequestParser()
register_parser.add_argument(
    "username", help="username field required", required=True, type=str)
register_parser.add_argument(
    "email", help="email field required", required=True, type=str)
register_parser.add_argument(
    "password", help="password field required", required=True, type=str)

login_parser = register_parser.copy()
login_parser.remove_argument('email')
login_parser.remove_argument('username')
login_parser.add_argument('userid', required=True, type=str,
                          help='userid field required')


class UserRegistration(Resource):
    def post(self):
        args = register_parser.parse_args()
        failed_msg = validate_registration(args)
        if failed_msg:
            return {'message': failed_msg}, 422
        new_username = args['username'].lower()
        new_email = args['email'].lower()
        try:
            cursor = mysql.get_db().cursor()
            username = username_exists(cursor, new_username)
            email = email_exists(cursor, new_email)
        except OperationalError as e:
            return error_resp(e)

        if username or email:
            return {'message': f'{"username " if username else "email "}'
                               'already exist'}, 409

        pwd_hash = bcrypt.generate_password_hash(
            args['password'].encode('utf-8'))

        try:
            sql = '''
            INSERT INTO user (username, password)
            VALUES (%s, %s)
            '''
            cursor.execute(sql, (new_username, pwd_hash))
            new_user_id = cursor.lastrowid

            sql = '''
            INSERT INTO email (address, user_id)
            VALUES (%s, %s)
            '''
            cursor.execute(sql, (new_email, new_user_id))
            new_email_id = cursor.lastrowid

            sql = '''
            INSERT INTO user_primary_email (user_id, email_id)
            VALUES (%s, %s)
            '''
            cursor.execute(sql, (new_user_id, new_email_id))
            mysql.get_db().commit()
        except OperationalError as e:
            return error_resp(e)

        mail_disabled = True  # disable mail sending
        if not mail_disabled:
            email = 'anon.software.dev@gmail.com'  # temporary recipient
            token = generate_email_token(email)
            url = request.url_root + f'confirm-email/{token}'
            send_confirmation_email(url, email)

        return {'message': f'user {new_username} registered',
                'username': new_username,
                'email': new_email}


class UserLogin(Resource):
    def post(self):
        args = login_parser.parse_args()
        if len(args['userid']) > 100:
            return {'message': 'username or email should be '
                               'less than 100 characters'}, 400
        try:
            cursor = mysql.get_db().cursor()
            sql = '''
            SELECT user.id, password, username FROM user JOIN email
            ON user.id = email.user_id
            WHERE email.address = %s or user.username = %s
            '''
            cursor.execute(sql, (args['userid'], args['userid']))
            result = cursor.fetchone()
        except OperationalError as e:
            return error_resp(e)

        if not result:
            return ({'message': 'incorrect userid/password combination'},
                    409)

        user_id, password, username = result
        if bcrypt.check_password_hash(password.decode('utf-8'),
                                      args['password']):
            access_token = create_access_token(identity=user_id)
            refresh_token = create_refresh_token(identity=user_id)
            resp_body = {'message': f'username {username} '
                                    f'logged in successfully'}

            resp = jsonify(resp_body)
            set_access_cookies(resp, access_token)
            set_refresh_cookies(resp, refresh_token)
            return resp

        return ({'message': 'incorrect userid/password combination'},
                409)


class AdminRegister(Resource):
    reg_parser = reqparse.RequestParser()
    reg_parser.add_argument('login', required=True)
    reg_parser.add_argument('password', required=True)

    def register(self, db, login, password):
        cursor = db.cursor()
        sql = '''
        INSERT INTO dev.admin (admin_login, password) 
        SELECT * FROM (SELECT %s, %s) as tmp
        WHERE NOT EXISTS(SELECT * FROM dev.admin WHERE admin_login = %s);
        '''
        hash_pw = bcrypt.generate_password_hash(password.encode('utf-8'))
        try:
            rows = cursor.execute(sql, (login, hash_pw, login))
            if not rows:
                return {'message': 'admin already exist'}, 400
            db.commit()
        except OperationalError as e:
            print(e)
            return abort(500)

        return {'message': 'admin registered',
                'login_id': login}

    def post(self):
        args = self.reg_parser.parse_args()
        username = args['login']
        password = args['password']

        return self.register(mysql.get_db(), username, password)


class AdminLogin(Resource):
    admin_parser = reqparse.RequestParser()
    admin_parser.add_argument('admin_user', required=True)
    admin_parser.add_argument('admin_password', required=True)

    def login(self, db, admin, password):
        cursor = db.cursor()
        sql = '''
        SELECT id, password FROM admin
        WHERE admin_login = %s
        '''
        try:
            cursor.execute(sql, (admin,))
        except OperationalError as e:
            print(e)
            return abort(500)
        result = cursor.fetchone()
        if not result:
            return {'message': 'Admin not exist'}, 401
        uid, password_hash = result
        check = bcrypt.check_password_hash(password_hash.decode('UTF-8'),
                                           password)
        if not check:
            return {'message': 'incorrect admin/password combination'}, 401

        access_token = create_access_token(identity={'id': uid,
                                                     'role': 'admin'})
        refresh_token = create_refresh_token(identity={'id': uid,
                                                       'role': 'admin'})
        resp_body = {'message': f'admin {admin} '
                                f'logged in successfully'}

        resp = jsonify(resp_body)
        set_access_cookies(resp, access_token)
        set_refresh_cookies(resp, refresh_token)
        return resp

    def post(self):
        args = self.admin_parser.parse_args()
        admin = args['admin_user']
        password = args['admin_password']
        return self.login(mysql.get_db(), admin, password)


class TokenRefresh(Resource):
    @jwt_refresh_token_required
    def post(self):
        current_user = get_jwt_identity()
        resp = jsonify({'message': 'access token refreshed'})
        access_token = create_access_token(identity=current_user)
        set_access_cookies(resp, access_token)
        return resp


class UnsetToken(Resource):
    def delete(self):
        msg = 'token revoked successfully'
        if 'access_token_cookie' not in request.cookies:
            msg = 'token already revoked'
        resp = jsonify({'message': msg})
        unset_jwt_cookies(resp)
        return resp


class RevokeAccessToken(Resource):
    @jwt_required
    def delete(self):
        jti = get_raw_jwt()['jti']
        temp_blacklist.add(jti)
        return {'message': 'access token revoked'}


class RevokeRefreshToken(Resource):
    @jwt_refresh_token_required
    def delete(self):
        jti = get_raw_jwt()['jti']
        temp_blacklist.add(jti)
        return {'message': 'refresh token revoked'}
