# Remove Announcement

Remove announcement from system

**URL** : `/api/announcement`

**Method** : `DELETE`

**Auth required** : YES

**Data constraints**

```json
{ 
  "id": "[announcement id]"
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{
    "message": "announcement removed"
}
```
