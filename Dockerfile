FROM php:7.4-apache

# install the PHP extensions we need
RUN set -ex; \
	\
	apt-get update; \
	apt-get install -y \
		unzip \
		openssl \
		libcurl4-openssl-dev \
		libjpeg-dev \
		libpng-dev \
		libmcrypt-dev \
		libxml2-dev \
		libonig-dev \
		libzip-dev \
	; \
	rm -rf /var/lib/apt/lists/*; \
	\
	docker-php-ext-configure gd --with-jpeg=/usr; \
	docker-php-ext-install -j$(nproc) pdo_mysql curl dom gd mbstring json tokenizer zip exif

RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=2'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

RUN a2enmod rewrite

VOLUME /var/www/html

ENV TASTYIGNITER_VERSION 3.4.0

RUN set -ex; \
	curl -o tastyigniter.zip -fSL "https://codeload.github.com/tastyigniter/TastyIgniter/zip/v${TASTYIGNITER_VERSION}"; \
	unzip tastyigniter.zip -d /usr/src/; \
	rm tastyigniter.zip; \
	mv /usr/src/TastyIgniter-${TASTYIGNITER_VERSION} /usr/src/tastyigniter

COPY .htaccess /usr/src/tastyigniter/

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    cd /usr/src/tastyigniter && composer install

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["apache2-foreground"]
