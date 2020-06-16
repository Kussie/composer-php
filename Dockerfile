# Composer Docker Container
FROM prooph/composer:7.4

# Environmental Variables
ENV COMPOSER_HOME /root/composer
ENV COMPOSER_VERSION master

RUN apk add --no-cache --virtual .persistent-deps tidyhtml-dev

RUN set -xe \
    && docker-php-ext-install tidy 

# Set up the application directory
VOLUME ["/app"]
WORKDIR /app

# Set up the command arguments
CMD ["-"]
ENTRYPOINT ["composer", "--ansi"]
