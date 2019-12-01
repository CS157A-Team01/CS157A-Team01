from flask import abort, make_response
from flask_restful import Resource, reqparse
from flask_jwt_extended import jwt_required, get_jwt_identity
from extensions import mysql
from pymysql.err import OperationalError


def is_admin(user):
    return type(user) is dict and user['role'] == 'admin'


class Announcement(Resource):
    ano_parser = reqparse.RequestParser()
    ano_parser.add_argument('title', required=True)
    ano_parser.add_argument('body', required=True)

    del_parser = reqparse.RequestParser()
    del_parser.add_argument('id', required=True)

    db = None

    def make_announcement(self, user, title, body):
        cursor = self.db.cursor()
        sql = '''
        INSERT INTO announcement (title, body, admin_id)
        VALUE (%s, %s, %s)
        '''
        try:
            cursor.execute(sql, (title, body, user))
            self.db.commit()
        except OperationalError as e:
            print(e)
            return abort(500)
        return {'message': 'announcement added'}

    def get_announcement(self):
        cursor = self.db.cursor()
        sql = '''
        SELECT id, time, title, body FROM announcement
        '''
        try:
            cursor.execute(sql)
        except OperationalError as e:
            print(e)
            return abort(500)
        result = cursor.fetchall()

        ret = []
        for aid, time, title, body in result:
            ret.append({
                'id': aid,
                'time': time.strftime("%m/%d/%y %H:%M"),
                'title': title,
                'body': body
            })
        return ret

    def delete_announcement(self, aid):
        cursor = self.db.cursor()
        sql = '''
        DELETE FROM announcement
        WHERE id = %s
        '''
        try:
            rows = cursor.execute(sql, (aid,))
            if not rows:
                return {'message': 'no such announcement'}, 400
            self.db.commit()
        except OperationalError as e:
            print(e)
            return abort(500)

        return {'message': 'announcement removed'}

    @jwt_required
    def post(self):
        user = get_jwt_identity()
        if not is_admin(user):
            return {'message': 'unauthorized user'}, 401

        args = self.ano_parser.parse_args()
        title = args['title']
        body = args['body']

        uid = user['id']
        self.db = mysql.get_db()
        return self.make_announcement(uid, title, body)

    def get(self):
        self.db = mysql.get_db()
        return self.get_announcement()

    @jwt_required
    def delete(self):
        user = get_jwt_identity()
        if not is_admin(user):
            return {'message': 'unauthorized user'}, 401
        aid = self.del_parser.parse_args()['id']
        self.db = mysql.get_db()
        return self.delete_announcement(aid)
