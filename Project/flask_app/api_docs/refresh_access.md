# Refresh Access Token

Refresh the access token so it can be used to access resources again.
requires refresh token in the header

**URL** : `/api/refresh`

**Method** : `POST`

**Auth required** : YES (Refresh Token)

## Success Response

**Code** : `200 OK`

**Content examples**

When a valid refresh token is submitted

```json
{
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9..."
}
```
