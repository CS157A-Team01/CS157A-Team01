from extensions import db
from sqlalchemy.ext.associationproxy import association_proxy


temp_blacklist = set()


class User(db.Model):
    __tablename__ = 'user'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(128), unique=True)
    password = db.Column(db.LargeBinary(128), nullable=False)
    primary_email_id = db.Column(
        db.Integer, db.ForeignKey('email.id', name='fk_primary_email'),
        nullable=True)

    primary_email = db.relationship(
        'Email', post_update=True,
        primaryjoin='User.primary_email_id==Email.id'
    )
    email = db.relationship('Email', back_populates='user',
                            primaryjoin='User.id==Email.user_id')
    track_list = association_proxy('tracked_product', 'product')

    def __init__(self, username=None, password=None, primary_email=None):
        self.username = username
        self.password = password
        self.primary_email = primary_email

    def __repr__(self):
        return f'username: {repr(self.username)}, email: {repr(self.email)}'


class Email(db.Model):
    __tablename__ = 'email'
    id = db.Column(db.Integer, primary_key=True)
    address = db.Column(db.String(128), unique=True, nullable=False)

    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    user = db.relationship('User', back_populates='email',
                           primaryjoin='Email.user_id==User.id')

    def __repr__(self):
        return f'Email: {repr(self.address)}'


class Product(db.Model):
    __tablename__ = 'product'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(256), nullable=False)
    url = db.Column(db.Text, nullable=False)

    def __repr__(self):
        return f'Product: {repr(self.name)}'


class ProductTracked(db.Model):
    """
    Associates User and Product
    """
    __tablename__ = 'product_tracked'
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), primary_key=True)
    product_id = db.Column(
        db.Integer, db.ForeignKey('product.id'), primary_key=True)
    desired_price = db.Column(db.Float, nullable=False)

    user = db.relationship(
        'User', backref='tracked_product')
    product = db.relationship(
        'Product', backref=db.backref('tracked_by',
                                      cascade='all, delete-orphan'))

    def __init__(self, product=None, user=None, price=None):
        self.product = product
        self.user = user
        self.desired_price = price


class Announcement(db.Model):
    __tablename__ = 'announcement'
    id = db.Column(db.Integer, primary_key=True)
    time = db.Column(db.DateTime, nullable=False)
    title = db.Column(db.String(256), nullable=False)
    body = db.Column(db.Text, nullable=False)


class TokenBlacklist(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    jti = db.Column(db.String(36), nullable=False)
    token_type = db.Column(db.String(10), nullable=False)
    expires = db.Column(db.DateTime, nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    user = db.relationship('User', backref='blacklisted_tokens')
