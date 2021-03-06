from flask_restful import Api
from flask_jwt_extended import JWTManager
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from flask_cors import CORS
from flaskext.mysql import MySQL
from flask_mail import Mail

mysql = MySQL()
db = SQLAlchemy()
jwt = JWTManager()
bcrypt = Bcrypt()
api = Api()
cors = CORS()
mail = Mail()
