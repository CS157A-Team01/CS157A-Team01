# Login

Used to collect an access and refresh token for a registered user.
httponly cookies containing access and refresh token will be set, 
as well as CSRF tokens.  

**URL** : `/api/login`

**Method** : `POST`

**Auth required** : NO

**Data constraints**

```json
{
    "userid": "[valid email address or username]",
    "password": "[password in plain text]"
}
```

**Data example**

```json
{
    "userid": "iloveauth@example.com",
    "password": "abcd1234"
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{
    "message": "username demo logged in sucessfully"
}
```

## Error Response

**Condition** : If 'username' and 'password' combination is wrong.

**Code** : `409 CONFLICT`

**Content** :

```json
{
    "message": "incorrect username/password combination"
}
```
