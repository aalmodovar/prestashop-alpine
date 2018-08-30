FROM nginx:stable-alpine

RUN apk --no-cache add shadow && \
  usermod -u 10000 nginx && \
  groupmod -g 1003 nginx

# Estaria bien que se usara una variable de entorno para nombrar el server_name

COPY ./prestashop.conf /etc/nginx/conf.d/

