# Composer Docker Container
FROM prooph/php:7.4-cli

# Environmental Variables
ENV COMPOSER_HOME /root/composer
ENV COMPOSER_VERSION master

RUN apk add --no-cache --virtual .persistent-deps \
    git \
    libtidy-dev \
    unzip

RUN set -xe \
    && docker-php-ext-install \
        tidy \
        zip \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer global require hirak/prestissimo

# Set up the application directory
VOLUME ["/app"]
WORKDIR /app

# Set up the command arguments
CMD ["-"]
ENTRYPOINT ["composer", "--ansi"]