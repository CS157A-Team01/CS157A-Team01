# Revoke Access Token

Revoke the access token given at login time, preventing future use of it to access resource.
Should be called at logout.

**URL** : `/api/revoke/access`

**Method** : `DELETE`

**Auth required** : YES

## Success Response

**Code** : `200 OK`

**Content examples**

When a token has been successfully revoked and put into the blacklist

```json
{
    "message": "access token revoked"
}
```
