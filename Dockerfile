FROM alpine:edge

MAINTAINER Daniel Langemann <daniel.langemann@gmx.de>

RUN apk add --no-cache php7-fpm \
    nginx \
    supervisor

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Copy configuration
COPY etc/ /etc


# Copy project files or mount your project here
COPY var/www /var/www

VOLUME /var/www
EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
