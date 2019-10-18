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

Authorization Header format : 

`"X-CSRF-TOKEN": "[csrf_refresh or csrf_access token]"`

Closed endpoints require a valid access token to be included in the header of the
request. An access token can be acquired from the Login endpoint above.

* [Show info](get_user.md) : `GET /api/user`
* [Refresh access token](refresh_access.md) : `POST /api/refresh`