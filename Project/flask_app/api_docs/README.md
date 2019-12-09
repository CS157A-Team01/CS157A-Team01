# Rest API Documentation

All the API endpoint will be documented here, click on specific endpoint for detail usage

* Base path :  `http://localhost:5000`
  
* Full path example : `http://localhost:5000/api/register`

## Open Endpoints

Open endpoints require no Authentication.

* [Login](login.md) : `POST /api/login`
* [Register](register.md) : `POST /api/register`
* [Admin register](admin_register.md) `POST /api/admin-register`
* [Admin login](admin_login.md) `POST /api/admin-login`
* [Revoke tokens (logout)](revoke_access.md) : `DELETE /api/revoke`
* [Get comments](get_comments.md) `GET /api/comment/<retailer>/<product id>`
* [Get announcement](get_announcement.md) : `GET /api/announcement`
* [Get Specific Product](get_single_product.md) : `GET /api/product/<retailer>/<id>`

## Endpoints that require Authentication

Authorization Header for CSRF token format : 

`"X-CSRF-TOKEN": "[csrf_refresh_token or csrf_access_token]"`

Closed endpoints require the cookies set during login to be sent along with
the request, and the CSRF token must be set manually in the header to
prevent CSRF attacks. 

* [Show info](get_user.md) : `GET /api/user`
* [Add email](add_email.md) : `POST /api/user/email`
* [Delete email](delete_email.md): `DELETE /api/user/email`
* [Change username](change_username.md): `PUT /api/user/username`
* [Change password](change_password.md) : `PUT /api/user/password`
* [Refresh access token](refresh_access.md) : `POST /api/refresh`
* [Add product to tracking](add_tracking.md) : `POST /api/product`
* [Get current user's track list](get_tracking.md) : `GET /api/product`
* [Update product price](update_tracking.md) : `PUT /api/product`
* [Delete product from tracking](delete_tracking.md) : `DELETE /api/product`
* [Add comment to product](add_comment.md) : `POST /api/comment`
* [Add announcement](add_announcement.md) : `POST /api/announcement`
* [Remove announcement](delete_announcement.md) `DELETE /api/announcement`
