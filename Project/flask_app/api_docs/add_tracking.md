# Add Product for Tracking

Add new product to be track by current user

**URL** : `/api/product`

**Method** : `POST`

**Auth required** : YES

**Data constraints**

```json
{
    "url": "[url of the product]"
}
```

**Data example**

```json
{
    "url": "https://www.amazon.com/VIZ-PRO-Magnetic-Inches-Silver-Aluminium/dp/B00U398RDU/ref=sr_1_5?crid=1X7H3CNBA00XF&keywords=white+board&qid=1571796358&sprefix=white+bo%2Caps%2C237&sr=8-5"
}
```

## Success Response

**Code** : `200 OK` or `201 CREATED`

If product is not already in database response will be `201`, otherwise `200`

**Content example**

```json
{   
    "message": "product added to tracking",
    "title": "VIZ-PRO-Magnetic-Inches-Silver-Aluminium",
    "price": 29.99,
    "link": "https://www.amazon.com/dp/B00U398RDU",
    "new_item": "[boolean for debug purpose]"
}
```
