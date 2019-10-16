# Show Current User Information

Get the details of the currently Authenticated User's username and email

**URL** : `/api/user/`

**Method** : `GET`

**Auth required** : YES

## Success Response

**Code** : `200 OK`

**Content examples**

For a User with username demo on the local database where that User has saved an
email address as primary email.

```json
{
    "username": "demo",
    "primary_email": "demo@mail.com",
    "hashed_password": "[hashed password for demo purpose]"
}
```
