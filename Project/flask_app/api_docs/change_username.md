# Change Current User's Username

Update the user's username

**URL** : `/api/user/username`

**Method** : `PUT`

**Auth required** : YES

**Data constraints**

```json
{
    "new_username": "[new username]"
}
```

## Success Response

**Code** : `200 OK`

**Content examples**


```json
{ 
    "message": "username updated",
    "username": "[new username]"
}
```

## Error Response

**Code** : `409 Conflict`

**Condition** : The username is already in use

```json
{   
    "message": "username already in use"
}
```