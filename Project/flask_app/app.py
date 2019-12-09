import os
from flask import Flask, send_from_directory, Blueprint, safe_join
from config import DevelopmentConfig
from extensions import jwt, bcrypt, api, cors, mysql, mail


def create_app(config=None):
    new_app = Flask(__name__,
                    template_folder='../react_app/build',
                    static_folder='../react_app/build/static')
    new_app.config.from_object(config)

    with new_app.app_context():
        jwt.init_app(new_app)
        bcrypt.init_app(new_app)
        cors.init_app(new_app)
        mysql.init_app(new_app)
        mail.init_app(new_app)

    from model import temp_blacklist
    @jwt.token_in_blacklist_loader
    def check_if_token_in_blacklist(decrypted_token):
        return decrypted_token['jti'] in temp_blacklist

    # Let react handle routing
    @new_app.route('/', defaults={'path': ''})
    @new_app.route('/<path:path>')
    def serve(path):
        if path and os.path.exists(safe_join(new_app.template_folder, path)):
            return send_from_directory(new_app.template_folder, path)
        else:
            return send_from_directory(new_app.template_folder, 'index.html')

    from resources.authentication import (UserRegistration, UserLogin,
                                          TokenRefresh, UnsetToken,
                                          AdminLogin, AdminRegister)
    from resources.user import GetUserInfo, UpdateUserInfo
    from resources.products import (TrackProduct, NewComments, GetComments,
                                    GetSpecificProduct)
    from resources.admin import Announcement

    api.add_resource(UserRegistration, '/register')
    api.add_resource(UserLogin, '/login')
    api.add_resource(TokenRefresh, '/refresh')
    api.add_resource(UnsetToken, '/revoke')
    api.add_resource(GetUserInfo, '/user')
    api.add_resource(UpdateUserInfo, '/user/<string:option>')
    api.add_resource(TrackProduct, '/product')
    api.add_resource(GetSpecificProduct,
                     '/product/<string:retailer>/<string:pid>')
    api.add_resource(NewComments, '/comment')
    api.add_resource(GetComments,
                     '/comment/<string:retailer>/<string:prod_id>')
    api.add_resource(AdminLogin, '/admin-login')
    api.add_resource(AdminRegister, '/admin-register')
    api.add_resource(Announcement, '/announcement')

    api_bp = Blueprint('api', __name__)
    api.init_app(api_bp)
    new_app.register_blueprint(api_bp, url_prefix='/api')
    return new_app


if __name__ == "__main__":
    app = create_app(DevelopmentConfig)
    app.run()
