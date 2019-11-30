from itsdangerous import URLSafeTimedSerializer
import re
from flask_mail import Message
from flask import current_app, make_response, abort
from extensions import mail, bcrypt
from pymysql.err import OperationalError, IntegrityError


def delete_email(db, user_id, email):
    """
    delete email address from DB
    :param db:
    :param user_id:
    :param email:
    :return: Response Object
    """

    cursor = db.cursor()
    sql = '''
    DELETE FROM email
    WHERE address = %s
    AND user_id = %s
    '''
    rows_affected = cursor.execute(sql, (email, user_id))
    db.commit()
    if rows_affected == 0:
        return make_response({'message': 'email does not belong to user'}, 409)
    return make_response({'message': 'email deleted successfully'})


def change_username(db, user_id, new_username):
    """
    change username in DB
    :param db:
    :param user_id:
    :param new_username:
    :return: Response Object
    """

    err = validate_username(new_username)
    if err:
        return make_response({'message': err}, 400)

    cursor = db.cursor()
    exist = username_exists(cursor, new_username)
    if exist:
        return make_response({'message': 'username already in use'}, 409)

    sql = '''
    UPDATE user
    SET username = %s
    WHERE id = %s
    '''
    try:
        cursor.execute(sql, (new_username, user_id))
        db.commit()
    except OperationalError as e:
        print(e)
        return abort(500)

    return make_response({'message': 'username updated',
                          'username': new_username})


def change_password(db, user_id, new_pwd):
    """
    Change user's current password
    :param db:
    :param user_id:
    :param new_pwd:
    :return: Response Object
    """

    cursor = db.cursor()
    sql = '''
    UPDATE user
    SET password = %s
    WHERE id = %s
    '''
    pwd_hash = bcrypt.generate_password_hash(new_pwd.encode('utf-8'))
    try:
        cursor.execute(sql, (pwd_hash, user_id))
        db.commit()
    except OperationalError as e:
        print(e)
        return abort(500)

    return make_response({'message': 'password updated'})


def add_email(db, user, new_email):
    """
    Add email to database for current user
    :param db:
    :param new_email:
    :param user:
    :return: Response Object
    """

    err = validate_email(new_email)
    if err:
        return make_response({'message': err}, 400)

    cursor = db.cursor()
    try:
        # Check if email already in DB
        exist = email_exists(cursor, new_email)
        if exist:
            return make_response({'message': 'email already in use'}, 409)

        sql = '''
        INSERT INTO email (address, user_id)
        VALUES (%s, %s)
        '''
        cursor.execute(sql, (new_email, user))
        db.commit()

    except OperationalError as e:
        print(e)
        return abort(500)

    return make_response({'message': 'new email added',
                          'email': new_email})


def error_resp(error_msg, code=500):
    return make_response({'error': str(error_msg)}, code)


def username_exists(cursor, username):
    """
    Check if username already exists in the DB
    :param cursor:
    :param username:
    :return: query result or None
    """

    sql = '''
    SELECT * FROM user
    WHERE username = %s
    '''
    cursor.execute(sql, (username,))
    return cursor.fetchone()


def email_exists(cursor, email):
    """
    Check if email exists in DB
    :param cursor:
    :param email:
    :return: query result or None
    """

    sql = '''
    SELECT * FROM email
    WHERE address = %s
    '''
    cursor.execute(sql, (email,))
    return cursor.fetchone()


def validate_registration(args):
    username_test_failed = validate_username(args['username'])
    email_test_failed = validate_email(args['email'])
    if username_test_failed:
        return username_test_failed
    if email_test_failed:
        return email_test_failed
    return ''


def validate_username(username):
    username_re = r'^\w*$'
    if len(username) < 6 or len(username) > 30:
        return 'username length should be 6-30 characters'
    if not re.match(username_re, username):
        return 'username should contain only a-zA-Z0-9_ '
    return ''


def validate_email(email):
    email_re = r'^\S*@\S*\.\S*$'
    if len(email) > 100:
        return 'length of email should be less than 100'
    if not re.match(email_re, email):
        return 'invalid email format'
    return ''


def generate_email_token(email):
    serializer = URLSafeTimedSerializer(current_app.config['SECRET_KEY'])
    return serializer.dumps(email, salt='email-confirmation')


def confirm_token(token, expiration=3600):
    serializer = URLSafeTimedSerializer(current_app.config['SECRET_KEY'])
    email = serializer.loads(
        token,
        salt='email-confirmation',
        max_age=expiration
    )
    return email


def send_confirmation_email(confirm_url, email):
    msg = Message('Email Confirmation Test',
                  sender='anon.software.dev@gmail.com',
                  recipients=[email],
                  body=f'Hello, and goodbye, {confirm_url}')
    mail.send(msg)


def add_comment(db, user, retailer, product_id, comment):
    cursor = db.cursor()

    sql = '''
    INSERT INTO comment (body, user_id, product_id, retailer)
    VALUES (%s, %s, %s, %s)
    '''
    try:
        cursor.execute(sql, (comment, user, product_id, retailer))
        db.commit()
    except OperationalError as e:
        print(e)
        return abort(500)
    except IntegrityError as e:
        print(e)
        return error_resp('check retailer and product id', 400)
    return make_response({'message': 'comment added'}, 200)


def get_comment(db, retailer, prod_id):
    cursor = db.cursor()
    sql = '''
    SELECT username, body, date FROM comment JOIN user u ON 
    comment.user_id = 
    u.id
    JOIN product p ON comment.product_id = p.product_id AND comment.retailer 
    = p.retailer
    WHERE p.retailer = %s AND p.product_id = %s
    ORDER BY comment.date
    '''
    cursor.execute(sql, (retailer, prod_id))
    results = cursor.fetchall()
    if not results:
        return make_response({'message': 'no comments found'}, 200)
    comments = []
    for username, comment, date in results:
        comments.append({
            "username": username,
            "comment": comment,
            "date": date.strftime("%m/%d/%y %H:%M")
        })
    return comments


def update_desired_price(db_con, user, retailer, product_id, price):
    cursor = db_con.cursor()
    sql = '''
    UPDATE product_tracked_by_user
    SET desired_price = %s
    WHERE user_id = %s AND retailer = %s AND product_id = %s
    '''
    try:
        row = cursor.execute(sql, (price, user, retailer, product_id))
        if not row:
            return make_response({'message': 'Fail to update'}, 400)
        db_con.commit()
    except OperationalError as e:
        print(e)
        return abort(500)

    return make_response({'message': 'price updated',
                          'retailer': retailer,
                          'product_id': product_id,
                          'price': price})
