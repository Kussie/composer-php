FROM prooph/php:7.4-cli
# Environmental Variables
ENV COMPOSER_HOME /root/composer
ENV COMPOSER_VERSION master
ENV COMPOSER_ALLOW_SUPERUSER 1

RUN set -xe \
    # use own name or other previous .persistent-deps will be removed
    && apk add --no-cache --virtual .persistent-deps-composer \
        zlib-dev \
        libzip-dev \
        git \
        tidyhtml-dev \
        unzip \
        exif \
    && docker-php-ext-install \
        zip \
        tidy \
        exif \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer global require hirak/prestissimo
# Set up the command arguments
CMD ["-"]
ENTRYPOINT ["composer", "--ansi"]