FROM php:8.4-cli

RUN apt-get update && apt-get install -y \
    git curl zip unzip libpng-dev libonig-dev \
    libxml2-dev libzip-dev openssh-client rsync

RUN docker-php-ext-install pdo_mysql mbstring zip

RUN curl --silent --show-error "https://getcomposer.org/installer" | php -- \
    --install-dir=/usr/local/bin --filename=composer

RUN composer global require "laravel/envoy=~2.12.1"

ENV PATH="/root/.config/composer/vendor/bin:${PATH}"
