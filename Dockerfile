FROM php:7.2-fpm

RUN apt-get update && apt-get install -y \
    git \
    unzip
    
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer --version

RUN docker-php-ext-install pdo_mysql

RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

COPY conf/php.ini /etc/php/7.2/fpm/conf.d/40-custom.ini
