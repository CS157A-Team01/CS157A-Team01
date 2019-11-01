[**API Documentation**](api_docs/README.md)

# Flask Setup for Testing


Install [Python 3.7.4](https://www.python.org/) or higher

#### Replace any `python/pip` with `python3/pip3` if on macOS!

### Step 1 (optional but highly recommended)

------------

Install virtualenv (virtual environment)

`pip install virtualenv`

Create environment

```
cd /Project/flask_app
virtualenv venv
```

Follow [this](https://virtualenv.pypa.io/en/stable/userguide/) guide to activate the environment for your particular system

Linux/OSX
`source /path/to/ENV/bin/activate`

Windows
`\path\to\env\Scripts\activate`

### Step 2

------------

Install requirements

	cd /Project/flask_app
	pip install -r requirements.txt

# Starting the Flask Server

---------
Activate the virtual environment from step 1 of setup, disregard this if setup
 was done outside of virtual environment


Run flask

    cd /Project/flask_app
    python app.py

API server should be accessible via `http://localhost:5000`

Follow [React's Documentation](../react_app/README.md) for front-end's setup
 and build
