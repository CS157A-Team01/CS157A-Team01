# Revoke Refresh Token

Revoke the refresh token given at login time, preventing future use of it to
 refresh access token.
Should be called at logout.

**URL** : `/api/revoke/refresh`

**Method** : `DELETE`

**Auth required** : YES

## Success Response

**Code** : `200 OK`

**Content examples**

When a token has been successfully revoked and put into the blacklist

```json
{
    "message": "refresh token revoked"
}
```
