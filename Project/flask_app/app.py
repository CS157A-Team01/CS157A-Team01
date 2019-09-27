import os
from flask import Flask, send_from_directory, Blueprint
from config import DevelopmentConfig
from extensions import db, jwt, bcrypt, api, cors


def create_app(config=None):
    app = Flask(__name__,
                template_folder='../react_app/build',
                static_folder='../react_app/build/static')
    app.config.from_object(config)

    with app.app_context():
        jwt.init_app(app)
        db.init_app(app)
        bcrypt.init_app(app)
        cors.init_app(app)

    from model import temp_blacklist
    @jwt.token_in_blacklist_loader
    def check_if_token_in_blacklist(decrypted_token):
        return decrypted_token['jti'] in temp_blacklist

    # Let react handle routing
    @app.route('/', defaults={'path': ''})
    @app.route('/<path:path>')
    def serve(path):
        if path and os.path.exists(app.template_folder + '/' + path):
            return send_from_directory(app.template_folder, path)
        else:
            return send_from_directory(app.template_folder, 'index.html')

    from resources.authentication import (UserRegistration, UserLogin,
                                          TokenRefresh, RevokeAccessToken,
                                          RevokeRefreshToken)
    from resources.user import GetUserInfo

    api.add_resource(UserRegistration, '/register')
    api.add_resource(UserLogin, '/login')
    api.add_resource(TokenRefresh, '/refresh')
    api.add_resource(RevokeAccessToken, '/revoke/access')
    api.add_resource(RevokeRefreshToken, '/revoke/refresh')
    api.add_resource(GetUserInfo, '/user')

    api_bp = Blueprint('api', __name__)
    api.init_app(api_bp)
    app.register_blueprint(api_bp, url_prefix='/api')
    return app


if __name__ == "__main__":
    app = create_app(DevelopmentConfig)
    app.run()
