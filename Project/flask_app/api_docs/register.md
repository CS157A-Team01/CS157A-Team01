# Register

Used to register a new user into the system

**URL** : `/api/register`

**Method** : `POST`

**Auth required** : NO

**Data constraints**

```json
{
	"username": "[6-30 alphanumeric characters]",
	"email": "[valid email format]",
	"password": "[plain text password]"
}
```

**Data example**

```json
{
	"username": "example",
	"email": "example@mail.com",
	"password": "example123"
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{
    "message": "username demo logged in sucessfully",
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9",
    "refresh_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9"
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
