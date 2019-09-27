import re
from flask_restful import Resource, reqparse
from model import User, temp_blacklist
from sqlalchemy.exc import OperationalError
from sqlalchemy import or_
from extensions import bcrypt, db
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
        try:
            username = User.query.filter_by(username=args['username']).first()
            email = User.query.filter_by(email=args['email']).first()
        except OperationalError:
            return {'message': 'something went wrong'}, 500

        if username or email:
            return {'message': f'{"username " if username else "email "}'
                    'already exist'}, 409

        pwd_hash = bcrypt.generate_password_hash(
            args['password'].encode('utf-8'))
        user = User(username=args['username'],
                    email=args['email'],
                    password=pwd_hash)
        try:
            db.session.add(user)
            db.session.commit()
        except OperationalError:
            return {'message': 'something went wrong'}, 500

        return {'message': f'user {user.username} registered',
                'username': user.username,
                'email': user.email}


class UserLogin(Resource):
    def post(self):
        args = login_parser.parse_args()
        if len(args['userid']) > 100:
            return {'message': 'username or email should be '
                    'less than 100 characters'}
        try:
            user = User.query.filter(
                or_(User.email == args['userid'],
                    User.username == args['userid'])).first()
        except OperationalError:
            return {'message': 'something went wrong'}, 500

        if not user:
            return ({'message': 'incorrect username/password combination'},
                    409)

        if bcrypt.check_password_hash(user.password.decode('utf-8'),
                                      args['password']):

            access_token = create_access_token(identity=user.id)
            refresh_token = create_refresh_token(identity=user.id)
            return {'message': f'username {user.username} '
                    'logged in successfully',
                    'access_token': access_token,
                    'refresh_token': refresh_token}

        return ({'message': 'incorrect username/password combination'},
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
