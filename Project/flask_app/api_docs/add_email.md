# Add Email for Current User

Add a new email address associated with the current user

**URL** : `/api/user/email`

**Method** : `POST`

**Auth required** : YES

**Data constraints**

```json
{
    "email": "[new email address]"
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{
  "email": "helloworld@mail.com",
  "message": "new email added"
}
```

## Error Response

**Code** : `409 Conflict`

**Condition** : The new email already exist

```json
{   
    "message": "email already in use"
}
```