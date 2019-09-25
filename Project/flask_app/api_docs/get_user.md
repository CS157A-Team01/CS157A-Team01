# Show Current User Information

Get the details of the currently Authenticated User's username and email

**URL** : `/api/user/`

**Method** : `GET`

**Auth required** : YES

## Success Response

**Code** : `200 OK`

**Content examples**

For a User with ID 1234 on the local database where that User has saved an
email address and name information.

```json
{
    "username": "demo",
    "email": "demo@mail.com"
}
```
