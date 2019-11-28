# Add comment to product

Add new comment to a specific product

**URL** : `/api/comment`

**Method** : `POST`

**Auth required** : YES

**Data constraints**

```json
{
    "comment": "[Comment body]",
    "retailer": "[retailer]",
    "product_id": "[product id]"
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{   
    "message": "comment added"
}
```
