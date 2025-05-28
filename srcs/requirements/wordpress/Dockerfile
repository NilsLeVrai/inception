FROM debian:bullseye

RUN apt update && \
    apt install -y php-fpm php-mysql 

RUN sed -i 's/^;daemonize = yes/daemonize = no/' /etc/php/7.4/fpm/php-fpm.conf

RUN mkdir -p /run/php

COPY ./script_wp.sh /

CMD ["/script_wp.sh"]
