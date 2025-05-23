FROM debian:bullseye

RUN apt update; apt install wordpress -y php-fpm php-mysql;

RUN sed -i 's/^;daemonize = yes/daemonize = no/' /etc/php/7.4/fpm/php-fpm.conf


CMD ["nginx", "-g", "daemon off;"]
