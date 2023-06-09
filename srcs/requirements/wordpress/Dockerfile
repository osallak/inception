FROM debian:bullseye

RUN apt update && apt install -y \
    php7.4 \
    php7.4-mysql \
    php7.4-fpm \
    curl

COPY ./requirements/wordpress/conf/wp-init.sh /tmp/wp-init.sh

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output wp &&\
    chmod +x wp &&\
    mv wp /usr/local/bin/wp

RUN chmod +x /tmp/wp-init.sh && mkdir -p /var/www/html &&\
    chown -R www-data:www-data /var/www/html && mkdir -p /run/php &&\
    chown -R www-data:www-data /run/php

EXPOSE 9000

CMD ["bash", "/tmp/wp-init.sh"]