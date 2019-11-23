#!/bin/bash
set -e

if [ ! -e '/var/www/html/index.php' ]; then
	tar cf - --one-file-system -C /usr/src/tastyigniter . | tar xf -
        chown -R www-data:www-data /var/www/html
	if [ -n "${MYSQL_HOSTNAME}" ]; then
		sed -i -e "s/127.0.0.1/$MYSQL_HOSTNAME/g" /var/www/html/config/database.php
                sed -i -e "s/'database' => 'database'/'database' => '$MYSQL_DATABASE'/g" /var/www/html/config/database.php
		sed -i -e "s/'username' => 'username'/'username' => '$MYSQL_USER'/g" /var/www/html/config/database.php
		sed -i -e "s/'password' => 'password'/'password' => '$MYSQL_PASSWORD'/g" /var/www/html/config/database.php
		sleep 60
		php artisan igniter:install -n
	        sed -i "/defaultTheme/a \    'urlPolicy' => 'secure'," /var/www/html/config/system.php
	fi


fi

exec "$@"
