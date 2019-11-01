# Delete Email for Current User

Delete the specified email address associated with the current user

**URL** : `/api/user/email`

**Method** : `DELETE`

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
  "message": "email deleted successfully"
}
```

## Error Response

**Code** : `409 Conflict`

**Condition** : The email does not belong to the current user or it does not
 exist in the database

```json
{   
    "message": "email does not belong to user"
}
```