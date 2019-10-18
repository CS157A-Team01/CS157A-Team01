"""
Configuration values for flask
"""
import os


class BaseConfig:
    DEBUG = False
    TESTING = False
    JWT_ERROR_MESSAGE_KEY = 'message'
    JWT_BLACKLIST_ENABLED = True
    JWT_TOKEN_LOCATION = ['cookies']
    JWT_BLACKLIST_TOKEN_CHECKS = ['access', 'refresh']
    JWT_CSRF_METHODS = ['GET', 'POST', 'PUT', 'PATCH', 'DELETE']
    JWT_ACCESS_COOKIE_PATH = '/api/'
    JWT_REFRESH_COOKIE_PATH = '/api/refresh'


class DevelopmentConfig(BaseConfig):
    DEBUG = True
    SECRET_KEY = 'dev-secret'
    JWT_SECRET_KEY = 'jwt-dev-secret'
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://admin:7Vn2LsWHk3U8ycvVqzPE@' \
                              'ec2-18-189-201-159.us-east-2.compute' \
                              '.amazonaws.com:3306/mock?charset=utf8mb4'

    MYSQL_DATABASE_HOST = 'ec2-18-189-201-159.us-east-2.compute' \
                          '.amazonaws.com'
    MYSQL_DATABASE_USER = 'admin'
    MYSQL_DATABASE_PASSWORD = '7Vn2LsWHk3U8ycvVqzPE'
    MYSQL_DATABASE_DB = 'dev'

    MAIL_SERVER = 'smtp.mailgun.org'
    MAIL_PORT = 587
    MAIL_USE_TLS = True
    MAIL_USERNAME = 'postmaster@sandboxe729eb98e30c4b77949fa6d8c9e2d197' \
                    '.mailgun.org'
    MAIL_PASSWORD = '8e2f21eba23d9f1e1edea8f3cb3a618a-9c988ee3-263cdc26'
    DEFAULT_MAIL_SENDER = 'anon.software.dev@gmail.com'


class TestConfig(DevelopmentConfig):
    DEBUG = False
    TESTING = True
    MYSQL_DATABASE_DB = 'unit_test'
    MAIL_SUPPRESS_SEND = True
    JWT_CSRF_IN_COOKIES = False


class ProductionConfig(BaseConfig):
    SECRET_KEY = os.environ.get('SECRET_KEY', None)
    JWT_SECRET_KEY = os.environ.get('JWT_SECRET_KEY', None)
