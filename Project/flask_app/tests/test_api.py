import unittest
from app import create_app
from config import TestConfig
from flask_jwt_extended import create_access_token
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
            'Authorization': f'Bearer {self.existing_token}'
        }
        response = self.client.get('/api/user', headers=header_dict)
        self.assertTrue(response.json)
        self.assertEqual(response.status_code, 200)


if __name__ == '__main__':
    unittest.main()

