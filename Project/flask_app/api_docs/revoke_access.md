# Revoke Token

Unset the csrf ,access, and refresh cookies

**URL** : `/api/revoke/`

**Method** : `DELETE`

**Auth required** : NO

## Success Response

**Code** : `200 OK`

**Content examples**

When the tokens have been successfully revoked and put into the blacklist

```json
{
    "message": "tokens revoked successfully"
}
```
