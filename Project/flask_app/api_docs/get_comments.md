# Get comment for specific product

get all comments for a specific product

**URL** : `/api/comment/<retailer>/<product id>`

**URL Example**: `/api/comment/walmart/55505580`

**Method** : `GET`

**Auth required** : NO


## Success Response

**Code** : `200 OK`

**Content example**

```json
[
    {
        "username": "mikewu",
        "comment": "test comment",
        "date": "11/25/19 03:11"
    },
    {
        "username": "mikewu",
        "comment": "test comment",
        "date": "11/25/19 03:35"
    },
    {
        "username": "mikewu",
        "comment": "test comment",
        "date": "11/25/19 03:37"
    },
    {
        "username": "mikewu",
        "comment": "test comment",
        "date": "11/25/19 03:37"
    },
    {
        "username": "mikewu",
        "comment": "test comment",
        "date": "11/25/19 03:38"
    },
    {
        "username": "mikewu2",
        "comment": "test comment from m2",
        "date": "11/25/19 04:25"
    }
]

```
