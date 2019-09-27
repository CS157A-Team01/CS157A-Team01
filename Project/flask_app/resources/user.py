from flask_restful import Resource
from flask_jwt_extended import jwt_required, get_jwt_identity
from model import User


class GetUserInfo(Resource):
    @jwt_required
    def get(self):
        current_user = get_jwt_identity()
        user = User.query.filter_by(id=current_user).first()
        return {'username': user.username, 'email': user.email}
