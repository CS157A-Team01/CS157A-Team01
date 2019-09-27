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


class ProductionConfig(BaseConfig):
    __secret = 'fUjXn2r5u8x/A?D(G+KaPdSgVkYp3s6v'
    SECRET_KEY = os.environ.get('SECRET_KEY', __secret)
