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
    SQLALCHEMY_DATABASE_URI = 'mysql://root:root@localhost:3306/mock'


class ProductionConfig(BaseConfig):
    __secret = 'fUjXn2r5u8x/A?D(G+KaPdSgVkYp3s6v'
    SECRET_KEY = os.environ.get('SECRET_KEY', __secret)
