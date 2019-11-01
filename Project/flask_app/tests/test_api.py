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
        self.test_username = 'existing'
        self.test_email = 'existing@mail.com'
        user_id = init_test_db(self.cursor, self.test_username,
                               self.test_email)
        with test_app.app_context():
            self.access_token = create_access_token(identity=user_id)
            self.refresh_token = create_refresh_token(identity=user_id)
            self.csrf_access = get_csrf_token(self.access_token)
            self.csrf_refresh = get_csrf_token(self.refresh_token)
            self.access_header = {
                'X-CSRF-TOKEN': f'{self.csrf_access}'
            }

        self.client.set_cookie('localhost',
                               'access_token_cookie',
                               value=self.access_token)
        self.client.set_cookie('localhost',
                               'refresh_token_cookie',
                               value=self.refresh_token)

        self.connection.commit()

    def tearDown(self):
        sql = 'DROP DATABASE IF EXISTS unit_test'
        self.cursor.execute(sql)
        self.connection.commit()
        self.connection.close()


class AuthTestCase(BaseTestCase):
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

    def test_get_user_info(self):
        response = self.client.get('/api/user', headers=self.access_header)
        self.assertFalse(response.json is None)
        self.assertEqual(response.status_code, 200)

    def test_add_new_email(self):
        data = {"email": "newemail@mail.com"}
        response = self.client.post('/api/user/email',
                                    headers=self.access_header,
                                    data=data)
        self.assertFalse(response.json is None)
        self.assertEqual(response.status_code, 200)

    def test_add_new_conflict_email(self):
        data = {"email": "existing@mail.com"}
        response = self.client.post('/api/user/email',
                                    headers=self.access_header,
                                    data=data)
        self.assertFalse(response.json is None)
        self.assertEqual(response.status_code, 409)

    def test_add_new_invalid_email(self):
        data = {"email": "".join(['e' for _ in range(120)])}
        response = self.client.post('/api/user/email',
                                    headers=self.access_header,
                                    data=data)
        self.assertFalse(response.json is None)
        self.assertEqual(response.status_code, 400)

    def test_delete_email(self):
        email = 'secondary@mail.com'
        data = {'email': email}
        response = self.client.delete('/api/user/email',
                                      headers=self.access_header,
                                      data=data)
        self.assertFalse(response.json is None)
        self.assertEqual(response.status_code, 200)
        sql = '''
        SELECT * FROM email WHERE address = %s
        '''
        self.cursor.execute(sql, email)
        result = self.cursor.fetchone()
        self.assertIsNone(result)

    def test_delete_email_not_exist(self):
        email = 'notexist@mail.com'
        data = {'email': email}
        response = self.client.delete('/api/user/email',
                                      headers=self.access_header,
                                      data=data)
        self.assertFalse(response.json is None)
        self.assertEqual(response.status_code, 409)

    def test_change_password(self):
        data = {"new_password": 'doesnt_matter'}
        response = self.client.put('/api/user/password',
                                   headers=self.access_header,
                                   data=data)
        self.assertFalse(response.json is None)
        self.assertEqual(response.status_code, 200)

    def test_change_username(self):
        new_username = 'somenewname'
        data = {"new_username": new_username}
        response = self.client.put('/api/user/username',
                                   headers=self.access_header,
                                   data=data)
        self.assertFalse(response.json is None)
        self.assertEqual(response.status_code, 200)
        sql = '''
        SELECT username FROM user
        WHERE username = %s
        '''
        self.cursor.execute(sql, new_username)
        expected_username = self.cursor.fetchone().get('username', None)
        self.assertEqual(expected_username, new_username)

    def test_change_username_conflict(self):
        new_username = self.test_username
        data = {"new_username": new_username}
        response = self.client.put('/api/user/username',
                                   headers=self.access_header,
                                   data=data)
        self.assertFalse(response.json is None)
        self.assertEqual(response.status_code, 409)


class ProductTestCase(BaseTestCase):

    def test_get_user_product(self):
        response = self.client.get('/api/product', headers=self.access_header)
        self.assertTrue(response.json is not None)
        self.assertEqual(response.status_code, 200)


if __name__ == '__main__':
    unittest.main()
