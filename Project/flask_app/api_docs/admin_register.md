# Admin Register

Used to register a new admin into the system

**URL** : `/api/admin-register`

**Method** : `POST`

**Auth required** : NO

**Data constraints**

```json
{
    "login": "[6-30 alphanumeric characters]",
    "password": "[plain text password]"
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{
    "message": "admin registered",
    "login_id": "admin"
}
```
