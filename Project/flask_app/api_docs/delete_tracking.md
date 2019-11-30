# Delete Tracked Product for User

Update product tracked by user

**URL** : `/api/product`

**Method** : `DELETE`

**Auth required** : YES

**Data example**

```json
{
    "retailer": "walmart",
    "product_id": "706173372"
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{
    "message": "product removed from tracking",
    "product_id": "706173372",
    "retailer": "walmart"
}
```
