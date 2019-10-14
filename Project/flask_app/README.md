[**API Documentation**](api_docs/README.md)

# Flask Setup

Install [Python 3.7.4](https://www.python.org/)

#### Replace any `python/pip` with `python3/pip3` if on macOS!

### Step 1 (optional but recommended)

------------

Install virtualenv (virtual environment)

`pip install virtualenv`

Create environment

```
cd /Project/flask_app
virtualenv venv
```

Follow [this](https://virtualenv.pypa.io/en/stable/userguide/) guide to activate the environment for your particular system

### Step 2

------------

Install requirements

	cd /Project/flask_app
	pip install -r requirements.txt

### Step 3

---

~~Make sure a MySQL instance is running on the machine on port 3306 with username `root` and password `root`~~

~~create a database called `mock` using `create database mock`~~

~~*(NOT RECOMMENDED) you could alternatively change line 18 of config.py to match your specific setup*~~

~~create necessary tables:~~

~~`python create_table.py `~~


### Step 4

---------

Run flask

    cd /Project/flask_app
    python app.py

If all goes well the API should be accessable via `http://localhost:5000`
