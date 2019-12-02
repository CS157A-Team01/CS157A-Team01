# Add Announcement

Add announcement to system

**URL** : `/api/announcement`

**Method** : `POST`

**Auth required** : YES

**Data constraints**

```json
{
    "title": "Test Announcement",
    "body": "This is a test announcement"
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{
    "message": "announcement added"
}
```
