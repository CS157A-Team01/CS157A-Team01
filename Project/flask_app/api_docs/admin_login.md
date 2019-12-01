# Admin Login

Used to collect an access and refresh token for a registered admin.
httponly cookies containing access and refresh token will be set, 
as well as CSRF tokens.  

**URL** : `/api/admin-login`

**Method** : `POST`

**Auth required** : NO

**Data example**

```json
{
    "admin_user": "admin",
    "admin_password": "test"
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{
    "message": "admin admin logged in sucessfully"
}
```

## Error Response

**Condition** : If 'username' and 'password' combination is wrong.

**Code** : `409 CONFLICT`

**Content** :

```json
{
    "message": "incorrect admin/password combination"
}
```
