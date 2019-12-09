# Get information of specific product

get information for a specific product

**URL** : `/api/product/<retailer>/<product id>`

**URL Example**: `/api/product/walmart/55505580`

**Method** : `GET`

**Auth required** : NO


## Success Response

**Code** : `200 OK`

**Content example**

```json
{
    "title": "Instant Pot LUX60 V3 6 Qt 6-in-1 Multi-Use Programmable Pressure Cooker, Slow Cooker, Rice Cooker, Sauté, Steamer, and Warmer",
    "url": "https://www.walmart.com/ip/55505580",
    "price": 54.99,
    "retailer": "walmart",
    "id": "55505580"
}
```
