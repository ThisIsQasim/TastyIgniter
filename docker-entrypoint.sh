#!/bin/bash
set -e

if [ ! -e '/var/www/html/index.php' ]; then
	tar cf - --one-file-system -C /usr/src/tastyigniter . | tar xf -
	chown -R www-data /var/www/html
	if [ -n "${!MYSQL_ENV_MYSQL_*}" ]; then
		sed -i -e 's/localhost/db/g' /var/www/html/system/tastyigniter/config/database.php
		sed -i -e 's/your database username/${MYSQL_USER}/g' /var/www/html/system/tastyigniter/config/database.php
		sed -i -e 's/your database password/${MYSQL_PASSWORD}/g' /var/www/html/system/tastyigniter/config/database.php
		sed -i -e 's/your database name/${MYSQL_DATABASE}/g' /var/www/html/system/tastyigniter/config/database.php
	fi
fi

exec "$@"
