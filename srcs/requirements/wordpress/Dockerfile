FROM debian:oldstable

RUN apt update && apt-get install php-fpm php-mysql curl -y

RUN mkdir -p /run/php

RUN sed -i 's/listen =.*/listen = wordpress:9000/g' /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /var/www/html

RUN chown -R www-data:www-data .

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/* /tmp/

ENTRYPOINT [ "/bin/bash", "/tmp/script.sh" ]
