from itsdangerous import URLSafeTimedSerializer
import re
from flask_mail import Message
from flask import current_app, make_response
from extensions import mail
import urllib.parse


def error_resp(error_msg, code=500):
    return make_response({'error': str(error_msg)}, code)


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


def generate_email_token(email):
    serializer = URLSafeTimedSerializer(current_app.config['SECRET_KEY'])
    return serializer.dumps(email, salt='email-confirmation')


def confirm_token(token, expiration=3600):
    serializer = URLSafeTimedSerializer(current_app.config['SECRET_KEY'])
    email = serializer.loads(
        token,
        salt='email-confirmation',
        max_age=expiration
    )
    return email


def send_confirmation_email(confirm_url, email):
    msg = Message('Email Confirmation Test',
                  sender='anon.software.dev@gmail.com',
                  recipients=[email],
                  body=f'Hello, and goodbye, {confirm_url}')
    mail.send(msg)


def which_retailer(url):
    parsed_url = urllib.parse.urlparse(url)
    if 'amazon.com' in parsed_url.hostname:
        return 'amazon'
    return None
