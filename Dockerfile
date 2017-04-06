FROM php:fpm-alpine

MAINTAINER Antonio Almodóvar <antonio@gmail.com>

RUN apk --update --no-cache add \
  tzdata \
  autoconf \
  bzip2 \
  bzip2-dev \
  file \
  gettext-dev \
  g++ \
  gcc \
  libc-dev \
  make \
  pkgconf \
  re2c \
  freetype \
  libpng \
  libjpeg-turbo \
  freetype-dev \
  libpng-dev \
  libjpeg-turbo-dev \
  libmcrypt-dev \
  icu icu-libs icu-dev\
&& docker-php-ext-install mcrypt mysqli pdo pdo_mysql intl\
&& docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-png-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-install gd \
&& docker-php-ext-install bcmath bz2 calendar gettext \
&& cp /usr/share/zoneinfo/Europe/Madrid /etc/localtime \
&& echo "Europe/Madrid" >  /etc/timezone \
&& apk del tzdata autoconf file g++ gcc libc-dev make pkgconf re2c icu-dev

COPY zz-custom.ini /usr/local/etc/php/conf.d/

COPY docker-php-entrypoint /usr/local/bin/

