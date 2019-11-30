# Update Tracked Product Price

Update product price

**URL** : `/api/product`

**Method** : `PUT`

**Auth required** : YES

**Data example**

```json
{
    "retailer": "walmart",
    "product_id": "706173372",
    "price": 888
}
```

## Success Response

**Code** : `200 OK`

**Content example**

```json
{
    "message": "price updated",
    "price": 888.0,
    "product_id": "706173372",
    "retailer": "walmart"
}
```
