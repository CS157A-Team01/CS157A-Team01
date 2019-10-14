import re
from flask_restful import Resource, reqparse
from model import temp_blacklist
from extensions import bcrypt, mysql
from flask_jwt_extended import (create_access_token, create_refresh_token,
                                get_jwt_identity, jwt_refresh_token_required,
                                jwt_required, get_raw_jwt)

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


def validate_registration(args):
    username_test_failed = validate_username(args)
    email_test_failed = validate_email(args)
    if username_test_failed:
        return username_test_failed
    if email_test_failed:
        return email_test_failed
    return ''


def validate_username(args):
    username_re = r'^\w*$'
    username = args['username']
    if len(username) < 6 or len(username) > 30:
        return 'username length should be 6-30 characters'
    if not re.match(username_re, args['username']):
        return 'username should contain only a-zA-Z0-9_ '
    return ''


def validate_email(args):
    email_re = r'^\S*@\S*\.\S*$'
    email = args['email']
    if len(email) > 100:
        return 'length of email should be less than 100'
    if not re.match(email_re, args['email']):
        return 'invalid email format'
    return ''


class UserRegistration(Resource):
    def post(self):
        args = register_parser.parse_args()
        failed = validate_registration(args)
        if failed:
            return {'message': failed}, 422
        cursor = mysql.get_db().cursor()

        cursor.execute(
            "SELECT * FROM user WHERE username LIKE %s",
            (args['username'],))
        username = cursor.fetchone()

        sql = "SELECT * FROM email WHERE address LIKE %s"
        cursor.execute(sql, (args['email']))
        email = cursor.fetchone()

        if username or email:
            return {'message': f'{"username " if username else "email "}'
                               'already exist'}, 409

        pwd_hash = bcrypt.generate_password_hash(
            args['password'].encode('utf-8'))

        cursor.execute("INSERT INTO user (username, password)"
                       "VALUES (%s, %s)",
                       (args['username'], pwd_hash))
        new_user_id = cursor.lastrowid
        sql = f"INSERT INTO email (address, user_id) " \
              f"VALUES (%s,{new_user_id})"
        cursor.execute(sql, args['email'])
        new_email_id = cursor.lastrowid

        sql = 'INSERT INTO user_primary_email (user_id, email_id) ' \
              'VALUES (%s, %s)'
        cursor.execute(sql, (new_user_id, new_email_id))

        mysql.get_db().commit()

        return {'message': f'user {args["username"]} registered',
                'username': args["username"],
                'email': args["email"]}


class UserLogin(Resource):
    def post(self):
        args = login_parser.parse_args()
        if len(args['userid']) > 100:
            return {'message': 'username or email should be '
                               'less than 100 characters'}, 400

        cursor = mysql.get_db().cursor()
        sql = "SELECT user.id, password, username FROM user JOIN email " \
              "on user.id = email.user_id " \
              "WHERE email.address = %s or user.username = %s"
        cursor.execute(sql, (args['userid'], args['userid']))
        result = cursor.fetchone()

        if not result:
            return ({'message': 'incorrect userid/password combination'},
                    409)

        user_id, password, username = result
        if bcrypt.check_password_hash(password.decode('utf-8'),
                                      args['password']):
            access_token = create_access_token(identity=user_id)
            refresh_token = create_refresh_token(identity=user_id)
            return {'message': f'username {username} '
                               'logged in successfully',
                    'access_token': access_token,
                    'refresh_token': refresh_token}

        return ({'message': 'incorrect userid/password combination'},
                409)


class TokenRefresh(Resource):
    @jwt_refresh_token_required
    def post(self):
        current_user = get_jwt_identity()
        return {
            'access_token': create_access_token(identity=current_user)
        }


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
