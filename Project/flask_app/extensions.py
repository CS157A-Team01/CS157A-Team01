from flask import Blueprint
from flask_restful import Api
from flask_jwt_extended import JWTManager
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from flask_cors import CORS

db = SQLAlchemy()
jwt = JWTManager()
bcrypt = Bcrypt()
api_bp = Blueprint('api', __name__)
api = Api(api_bp)
cors = CORS()