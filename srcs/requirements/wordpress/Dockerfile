FROM debian:stable

COPY conf/wp-init.sh /tmp/wp-init.sh

RUN chmod +x /tmp/wp-init.sh && mkdir -p /var/www/html &&\
    chown -R www-data:www-data /var/www/html

RUN apt-get update && apt-get install -y \
    php7.3 \
    php-mysql \
    php-fpm \
    php-cli \
    curl


RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output wp &&\
    chmod +x wp &&\
    mv wp /usr/local/bin/wp

USER www-data

CMD ["wp", "cli", "version"]