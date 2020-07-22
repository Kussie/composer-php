# Docker PHP Composer

PHP with Composer and HTML Tidy for DockerHub.

# What is Composer?

Composer is a tool for dependency management in PHP, written in PHP. It allows you to declare the libraries your project depends on and it will manage (install/update) them for you.

You can read more about Composer in the [official documentation](https://getcomposer.org/doc/).

## Getting Started

This repo contains at least one branch used to auto-build docker images on [DockerHub](https://hub.docker.com/r/intellipharm/php-composer).

* `master` -> Builds image `intellipharm/php-composer:latest`

## Usage

Build the `composer` container and tag `latest`

``` shell
docker build -t intellipharm/php-composer:latest .
```

Running the `composer` image is as simple as follows:

``` shell
docker run --rm --interactive --tty \
--volume $PWD:/app \
--work-dir /app \
intellipharm/php-composer:latest install
```

Run `composer install`

``` shell
docker run --rm -it \
-v ${DIR}/api:/app \
-w /app \
intellipharm/php-composer:latest install
```

Run `composer update`

``` shell
docker run --rm -it \
-v ${DIR}/api:/app \
-w /app \
intellipharm/php-composer:latest update
```

Run `composer dump-autoload`

``` shell
docker run --rm -it \
-v ${DIR}/api:/app \
-w /app \
intellipharm/php-composer:latest dump-autoload
```
