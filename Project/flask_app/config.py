"""
Configuration values for flask
"""
import os


class BaseConfig:
    DEBUG = False
    TESTING = False
    JWT_BLACKLIST_ENABLED = True
    JWT_BLACKLIST_TOKEN_CHECKS = ['access', 'refresh']


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


class TestConfig(DevelopmentConfig):
    DEBUG = False
    TESTING = True
    MYSQL_DATABASE_DB = 'unit_test'


class ProductionConfig(BaseConfig):
    SECRET_KEY = os.environ.get('SECRET_KEY', None)
    JWT_SECRET_KEY = os.environ.get('JWT_SECRET_KEY', None)
