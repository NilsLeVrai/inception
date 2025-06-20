FROM debian:bullseye

RUN apt update -y && \
	apt upgrade -y && \
	apt install -y php7.4 php-fpm php-mysql mariadb-client && \
	apt clean && rm -rf /var/lib/apt/lists/*

RUN sed -i 's/^;daemonize = yes/daemonize = no/' /etc/php/7.4/fpm/php-fpm.conf

RUN mkdir -p /run/php

COPY ./script_wp.sh /

EXPOSE 9000

CMD ["/script_wp.sh"]
