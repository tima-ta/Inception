#!/bin/bash

wp --allow-root core download

wp config create --allow-root \
	--dbname=$DBname \
	--dbuser=$DBuser \
	--dbpass=$DBpasswd \
	--dbhost=mariadb:3306

wp core install --allow-root \
	--url=$mySiteURL \
	--title=$Tilte \
	--admin_user=$Admin \
	--admin_password=$AdminPasswd \
	--admin_email=$AdminEmail

wp user create --allow-root tima tima@gmail.com --role=editor

php-fpm7.4 -F
