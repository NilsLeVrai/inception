FROM debian:bookworm

RUN apt update -y && \
	apt upgrade -y && \
	apt install -y php-fpm php-mysql mariadb-client curl gzip && \
	apt clean && rm -rf /var/lib/apt/lists/*

RUN sed -i 's/^;daemonize = yes/daemonize = no/' /etc/php/8.2/fpm/php-fpm.conf

RUN mkdir -p /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY wordpress.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY ./script_wp.sh /

EXPOSE 9000

RUN chmod +x /script_wp.sh
CMD ["/script_wp.sh"]
