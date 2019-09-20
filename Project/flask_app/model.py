from app import db

temp_blacklist = set()


class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(128), unique=True, nullable=False)
    email = db.Column(db.String(128), unique=True, nullable=False)
    password = db.Column(db.Binary(128), nullable=False)


# class TokenBlacklist(db.Model):
#     id = db.Column(db.Integer, primary_key=True)
#     jti = db.Column(db.String(36), nullable=False)
#     token_type = db.Column(db.String(10), nullable=False)
#     user_identity = db.Column(db.String(50), nullable=False)
#     revoked = db.Column(db.Boolean, nullable=False)
#     expires = db.Column(db.DateTime, nullable=False)
