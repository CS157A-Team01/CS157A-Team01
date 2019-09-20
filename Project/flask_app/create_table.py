# only run for table creation

from app import db, create_app
from config import DevelopmentConfig


def make_table():
    app = create_app(DevelopmentConfig)
    with app.app_context():
        db.create_all()


if __name__ == '__main__':
    make_table()
