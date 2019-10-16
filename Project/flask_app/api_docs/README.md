# Rest API Documentation

All the API endpoint will be documented here, click on specific endpoint for detail usage

* Base path :  `http://localhost:5000/`
  
* Full path example : `http://localhost:5000/api/register`

## Open Endpoints

Open endpoints require no Authentication.

* [Login](login.md) : `POST /api/login`
* [Register](register.md) : `POST /api/register`

## Endpoints that require Authentication

Authorization Header format : 

`"Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9"`

Closed endpoints require a valid access token to be included in the header of the
request. An access token can be acquired from the Login endpoint above.

* [Show info](get_user.md) : `GET /api/user`
* [Refresh access token](refresh_access.md) : `POST /api/refresh`
* [Revoke refresh token (logout)](revoke_refresh.md) : `DELETE /api/revoke/refresh`
* [Revoke access token (logout)](revoke_access.md) : `DELETE /api/revoke/access`