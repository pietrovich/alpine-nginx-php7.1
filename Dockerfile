FROM alpine:edge

MAINTAINER Daniel Langemann <daniel.langemann@gmx.de>

RUN apk add --no-cache \
    php7-fpm \
    php7-common \
    php7-opcache \
    gettext \
    nginx \
    supervisor

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

ENV SERVER_NAME localhost
ENV NGINX_ROOT "/var/www/html"

COPY etc/ /prepare
RUN rm /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/html; \
    chmod 0777 /var/www/html

VOLUME /var/www/html

EXPOSE 80 443

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
