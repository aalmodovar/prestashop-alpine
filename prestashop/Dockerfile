FROM php:7.0-fpm-alpine

MAINTAINER Antonio Almodóvar <antonio@gmail.com>

ENV PS_VERSION=1.7.3.3
ENV PS_URL=https://www.prestashop.com/download/old/prestashop_${PS_VERSION}.zip
ADD ${PS_URL} /tmp/prestashop.zip
ADD prestashop_${PS_VERSION}.zip /tmp/prestashop.zip

ENV PS_DOMAIN="<to be defined>" \
DB_SERVER="<to be defined>" \
DB_PORT=3306 \
DB_NAME=prestashop \
DB_USER=root \
DB_PASSWD=admin \
DB_PREFIX=ps_ \
ADMIN_MAIL=demo@prestashop.com \
ADMIN_PASSWD=prestashop_demo \
PS_LANGUAGE=en \
PS_COUNTRY=GB \
PS_INSTALL_AUTO=0 \
PS_ERASE_DB=0 \
PS_DEV_MODE=0 \
PS_HOST_MODE=0 \
#PS_HANDLE_DYNAMIC_DOMAIN=0 \
PS_FOLDER_ADMIN=admin \
PS_FOLDER_INSTALL=install \
PHP_FPM_CONF=/usr/local/etc/php-fpm.d/www.conf \
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

RUN mkdir /tmp/ps \
&& unzip -q /tmp/prestashop.zip -d /tmp/ps \
&& rm /tmp/prestashop.zip \
&& unzip -n -q /tmp/ps/prestashop.zip -d /var/www/html \
&& rm -rf /tmp/ps \
&& chown -R www-data:www-data /var/www/html/*

# Establecer los permisos según variables de entorno
# Parche para establecer un id de usuario si se pasa por variable de entorno

COPY docker-php-userid /usr/local/bin/
RUN docker-php-userid


# Ahora el script necesario para prestashop
COPY docker-php-prestashop /usr/local/bin/
RUN docker-php-prestashop


COPY zz-custom.ini /usr/local/etc/php/conf.d/


#COPY docker-php-entrypoint /usr/local/bin/

