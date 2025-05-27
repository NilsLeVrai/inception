FROM debian:bullseye

RUN apt update && \
    apt install -y php-fpm php-mysql && \
    apt clean && rm -rf /var/lib/apt/lists/*

RUN sed -i 's/^;daemonize = yes/daemonize = no/' /etc/php/7.4/fpm/php-fpm.conf

COPY ./script.sh /

EXPOSE 9000

CMD ["/script.sh"]
