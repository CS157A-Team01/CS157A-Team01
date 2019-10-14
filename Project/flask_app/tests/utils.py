from config import TestConfig
import pymysql
from extensions import bcrypt


def read_sql(file='test.sql'):
    with open(file, 'r', encoding='utf-8') as infile:
        content = infile.read()
    commands = content.replace('\n', '').split(';')[:-1]
    return commands


def get_db_connection():
    database_ip = TestConfig.MYSQL_DATABASE_HOST
    database_username = TestConfig.MYSQL_DATABASE_USER
    database_password = TestConfig.MYSQL_DATABASE_PASSWORD

    con = pymysql.connect(host=database_ip,
                          user=database_username,
                          password=database_password,
                          charset='utf8mb4',
                          cursorclass=pymysql.cursors.DictCursor)
    return con


def init_test_db(cursor):
    commands = read_sql('test_db_setup.sql')
    for command in commands:
        cursor.execute(command)

    pw = bcrypt.generate_password_hash('test')
    sql = "INSERT INTO user (username, password) " \
          "VALUES (%s, %s)"
    cursor.execute(sql, ('existing', pw))
    new_user_id = cursor.lastrowid
    sql = "INSERT INTO email (address, user_id) " \
          f"VALUES ('existing@mail.com',{new_user_id})"
    cursor.execute(sql)
    new_email_id = cursor.lastrowid
    sql = 'INSERT INTO user_primary_email (user_id, email_id) ' \
          'VALUES (%s, %s)'
    cursor.execute(sql, (new_user_id, new_email_id))
    return new_user_id

