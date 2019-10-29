# Rest API Documentation

All the API endpoint will be documented here, click on specific endpoint for detail usage

* Base path :  `http://localhost:5000`
  
* Full path example : `http://localhost:5000/api/register`

## Open Endpoints

Open endpoints require no Authentication.

* [Login](login.md) : `POST /api/login`
* [Register](register.md) : `POST /api/register`
* [Revoke tokens (logout)](revoke_access.md) : `DELETE /api/revoke`

## Endpoints that require Authentication

Authorization Header for CSRF token format : 

`"X-CSRF-TOKEN": "[csrf_refresh_token or csrf_access_token]"`

Closed endpoints require the cookies set during login to be sent along with
the request, and the CSRF token must be set manually in the header to
prevent CSRF attacks. 

* [Show info](get_user.md) : `GET /api/user`
* [Refresh access token](refresh_access.md) : `POST /api/refresh`
* [Add product to tracking](add_tracking.md) : `POST /api/product`
* [Get current user's track list](get_tracking.md) : `GET /api/product`
