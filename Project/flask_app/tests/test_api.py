import unittest
from app import create_app
from config import TestConfig
from flask_jwt_extended import (create_access_token, create_refresh_token,
                                get_csrf_token)
from tests.utils import get_db_connection, init_test_db

test_app = create_app(TestConfig)


class BaseTestCase(unittest.TestCase):

    def setUp(self):
        self.client = test_app.test_client()
        self.connection = get_db_connection()
        self.cursor = self.connection.cursor()
        user_id = init_test_db(self.cursor)
        with test_app.app_context():
            self.existing_token = create_access_token(identity=user_id)
            self.refresh_token = create_refresh_token(identity=user_id)
            self.csrf_access = get_csrf_token(self.existing_token)
            self.csrf_refresh = get_csrf_token(self.refresh_token)
        self.client.set_cookie('localhost',
                               'access_token_cookie',
                               value=self.existing_token)
        self.client.set_cookie('localhost',
                               'refresh_token_cookie',
                               value=self.refresh_token)

        self.connection.commit()

    def tearDown(self):
        sql = 'DROP DATABASE IF EXISTS unit_test'
        self.cursor.execute(sql)
        self.connection.commit()
        self.connection.close()


class UserTestCase(BaseTestCase):
    def test_user_registration_success(self):
        data_dict = {
            'username': 'unittester',
            'email': 'unittester@mail.com',
            'password': 'unittest'
        }
        response = self.client.post('/api/register', data=data_dict)
        self.assertTrue(response.json)
        self.assertEqual(response.status_code, 200)

    def test_user_registration_username_conflict(self):
        data_dict = {
            'username': 'existing',
            'email': 'unittester@mail.com',
            'password': 'unittest'
        }
        response = self.client.post('/api/register', data=data_dict)
        self.assertTrue(response.json)
        self.assertEqual(response.status_code, 409)

    def test_user_registration_email_conflict(self):
        data_dict = {
            'username': 'unittester',
            'email': 'existing@mail.com',
            'password': 'unittest'
        }
        response = self.client.post('/api/register', data=data_dict)
        self.assertTrue(response.json)
        self.assertEqual(response.status_code, 409)

    def test_user_registration_username_too_long(self):
        username = ''
        for _ in range(150):
            username += 'x'
        data_dict = {
            'username': username,
            'email': 'existing@mail.com',
            'password': 'unittest'
        }
        response = self.client.post('/api/register', data=data_dict)
        self.assertTrue(response.json)
        self.assertEqual(response.status_code, 422)

    def test_user_registration_email_too_long(self):
        email = ''
        for _ in range(150):
            email += 'x'
        data_dict = {
            'username': 'unittester',
            'email': email,
            'password': 'unittest'
        }
        response = self.client.post('/api/register', data=data_dict)
        self.assertTrue(response.json)
        self.assertEqual(response.status_code, 422)

    def test_user_login_success(self):
        data_dict = {
            'userid': 'existing',
            'password': 'test'
        }
        response = self.client.post('/api/login', data=data_dict)
        self.assertTrue(response.json)
        self.assertEqual(response.status_code, 200)

    def test_user_login_wrong_password(self):
        data_dict = {
            'userid': 'existing',
            'password': 'wrongpassword'
        }
        response = self.client.post('/api/login', data=data_dict)
        self.assertTrue(response.json)
        self.assertEqual(response.status_code, 409)

    def test_user_login_wrong_userid(self):
        data_dict = {
            'userid': 'notexisting',
            'password': 'test'
        }
        response = self.client.post('/api/login', data=data_dict)
        self.assertTrue(response.json)
        self.assertEqual(response.status_code, 409)

        data_dict['userid'] = 'notthisemail@mail.com'
        response = self.client.post('/api/login', data=data_dict)
        self.assertTrue(response.json)
        self.assertEqual(response.status_code, 409)

    def test_get_user_info(self):
        header_dict = {
            'X-CSRF-TOKEN': f'{self.csrf_access}'
        }
        response = self.client.get('/api/user', headers=header_dict)
        self.assertTrue(response.json)
        self.assertEqual(response.status_code, 200)

    def test_access_token_refresh(self):
        header_dict = {
            'X-CSRF-TOKEN': f'{self.csrf_refresh}'
        }
        response = self.client.post('/api/refresh',
                                    headers=header_dict)
        self.assertTrue(response.json)
        try:
            self.assertEqual(response.status_code, 200)
        except AssertionError:
            print(response.json)
            raise AssertionError

    def test_token_revoke(self):
        response = self.client.delete('/api/revoke')
        self.assertTrue(response.json)
        self.assertEqual(response.status_code, 200)


if __name__ == '__main__':
    unittest.main()
