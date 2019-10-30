# Change Current User's Password

Update the user's password with a new one

**URL** : `/api/user/password`

**Method** : `PUT`

**Auth required** : YES

**Data constraints**

```json
{
    "new_password": "[new password]"
}
```

## Success Response

**Code** : `200 OK`

**Content examples**


```json
{
    "message": "password updated"
}
```
