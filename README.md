
Prestashop last 1.6 version with nginx - php-fpm - mariadb.

**BUILD**

docker-compose run --rm -e PS_DOMAIN="prestashop.local" \
-e DB_SERVER="database" \
-e DB_PORT=3306 \
-e DB_NAME=prestashop \
-e DB_USER=prestashop \
-e DB_PASSWD=prestasop \
-e DB_PREFIX=ps_ \
-e ADMIN_MAIL=demo@prestashop.com \
-e ADMIN_PASSWD=prestashop_demo \
-e PS_LANGUAGE=es \
-e PS_COUNTRY=ES \
-e PS_INSTALL_AUTO=1 \
-e PS_ERASE_DB=0 \
-e PS_DEV_MODE=0 \
-e PS_HOST_MODE=0 \
-e PS_FOLDER_ADMIN=admin \
-e PS_FOLDER_INSTALL=install
prestashop docker-php-prestashop

If differents user/group ids are needed:
docker-compose run --rm --no-deps prestashop chown -R xxxx:xxxx /var/www/html

**RUN**
docker-compose up

Set prestashop.local in hosts file and test it.
