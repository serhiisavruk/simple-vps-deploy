FROM php:7.2.32-fpm

RUN apt-get update && apt-get install -y \
        curl \
        zip \
        unzip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./docker/php/conf/php.ini /usr/local/etc/php/
COPY ./docker/php/conf/php-fpm.conf /usr/local/etc/php-fpm.d/

COPY . /var/www/html

WORKDIR /var/www/html

EXPOSE 9000

CMD ["php-fpm"]
