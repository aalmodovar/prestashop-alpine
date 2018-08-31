FROM php:7.0-fpm-alpine

MAINTAINER Antonio Almodóvar <antonio@gmail.com>

ENV PS_VERSION=1.6.1.20
ENV PS_URL=https://www.prestashop.com/download/old/prestashop_${PS_VERSION}.zip

ENV PHP_FPM_CONF=/usr/local/etc/php-fpm.d/www.conf \
PHPFPMUSERID=10000 \
PHPFPMGRPID=1003

RUN apk --update --no-cache add \
  mysql-client \
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
  icu icu-libs icu-dev \
  libltdl libmcrypt libmcrypt-dev \
&& docker-php-ext-install mysqli pdo pdo_mysql intl \
&& docker-php-ext-configure mcrypt --with-mcrypt && docker-php-ext-install mcrypt \
&& docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-png-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-install gd \
&& docker-php-ext-install bcmath bz2 calendar gettext opcache zip \
&& pecl install xdebug && docker-php-ext-enable xdebug \
&& docker-php-source delete \
&& cp /usr/share/zoneinfo/Europe/Madrid /etc/localtime \
&& echo "Europe/Madrid" >  /etc/timezone \
&& apk del tzdata autoconf file g++ gcc libc-dev make pkgconf re2c icu-dev libmcrypt-dev

COPY docker-php-prestashop /usr/local/bin/

# Establecer los permisos según variables de entorno
# Parche para establecer un id de usuario si se pasa por variable de entorno

COPY docker-php-userid /usr/local/bin/
RUN docker-php-userid

COPY zz-custom.ini /usr/local/etc/php/conf.d/


