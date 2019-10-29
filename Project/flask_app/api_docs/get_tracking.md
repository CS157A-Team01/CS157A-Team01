# Get Product Tracked by Current User

Return a list of product that is currently tracked by the user with relevant
 information

**URL** : `/api/product`

**Method** : `GET`

**Auth required** : YES


## Success Response

**Code** : `200 OK`

Empty array if user currently not tracking anything

**Content example**

```json
[
    {
        "retailer": "amazon",
        "title": "Lasko Designer Series Ceramic Space Heater-Features Oscillation, Remote, and Built-in Timer, Beige",
        "url": "https://www.amazon.com/dp/B000N22JX6",
        "price": 45.99,
        "desired_price": 1000.0
    },
    {
        "retailer": "amazon",
        "title": "DEWALT Titanium Drill Bit Set, Pilot Point, 21-Piece (DW1361)",
        "url": "https://www.amazon.com/dp/B004GIO0F8",
        "price": 23.01,
        "desired_price": 666.0
    },
    {
        "retailer": "amazon",
        "title": "Nestle Chocolate Assorted Halloween Candy, Bulk Minis Bag with Butterfinger, Crunch & Baby Ruth (90 Count)",
        "url": "https://www.amazon.com/dp/B005K6ZLSK",
        "price": 9.56,
        "desired_price": 666.0
    },
    {
        "retailer": "amazon",
        "title": "Kindle Paperwhite – Now Waterproof with 2x the Storage – Includes Special Offers",
        "url": "https://www.amazon.com/dp/B07CXG6C9W",
        "price": 89.99,
        "desired_price": 666.0
    },
    {
        "retailer": "amazon",
        "title": "Seagate Expansion Portable 2TB External Hard Drive HDD – USB 3.0 for PC Laptop (STEA2000422)",
        "url": "https://www.amazon.com/dp/B07T5FW2CL",
        "price": 49.99,
        "desired_price": 666.66
    }
]
```
