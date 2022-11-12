
FROM php:8-fpm




# Install php && ext

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        zip unzip \
        zlib1g-dev libicu-dev g++ \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install intl \
    && docker-php-ext-install opcache





# Add custom.ini to overwrite php.ini for configure PHP


ADD conf/php/custom.ini /usr/local/etc/php/conf.d/custom.ini



RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ADD /data /var/www/

WORKDIR /var/www/cryptogeek
RUN composer install
