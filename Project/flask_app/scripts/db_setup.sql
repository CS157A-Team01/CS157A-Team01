
CREATE TABLE IF NOT EXISTS user(
id INT AUTO_INCREMENT,
username varchar(60) NOT NULL UNIQUE,
password tinyblob NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS email(
id INT AUTO_INCREMENT,
address varchar(100) NOT NULL UNIQUE,
confirmed boolean NOT NULL DEFAULT 0,
user_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(user_id) REFERENCES user(id)
);

CREATE TABLE IF NOT EXISTS product(
name varchar(300),
url text,
price FLOAT,
product_id VARCHAR(20),
retailer VARCHAR(20),
PRIMARY KEY(product_id, retailer)
);

CREATE TABLE IF NOT EXISTS product_tracked_by_user(
product_id VARCHAR(20) NOT NULL,
retailer VARCHAR(20) NOT NULL,
user_id INT NOT NULL,
desired_price FLOAT NOT NULL,
PRIMARY KEY(product_id, retailer, user_id),
FOREIGN KEY(product_id, retailer) REFERENCES product(product_id, retailer), 
FOREIGN KEY(user_id) REFERENCES user(id)
);

CREATE TABLE IF NOT EXISTS admin(
id INT AUTO_INCREMENT,
admin_login varchar(128) NOT NULL UNIQUE,
password tinyblob NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS announcement(
id INT AUTO_INCREMENT,
time timestamp,
title varchar(256),
body text,
admin_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(admin_id) REFERENCES admin(id)
);

CREATE TABLE IF NOT EXISTS comment(
id INT AUTO_INCREMENT,
body text NOT NULL,
date timestamp,
user_id INT NOT NULL,
product_id VARCHAR(20) NOT NULL,
retailer VARCHAR(20) NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(user_id) REFERENCES user(id),
FOREIGN KEY(product_id, retailer) REFERENCES product(product_id, retailer)
);

CREATE TABLE IF NOT EXISTS token_blacklist(
jti varchar(36),
token_type varchar(10),
expires datetime,
user_id INT,
PRIMARY KEY(jti),
FOREIGN KEY(user_id) REFERENCES user(id)
);

CREATE TABLE IF NOT EXISTS user_primary_email(
user_id INT UNIQUE,
email_id INT UNIQUE,
PRIMARY KEY(user_id, email_id),
FOREIGN KEY(user_id) REFERENCES user(id),
FOREIGN KEY(user_id) REFERENCES email(id)
);