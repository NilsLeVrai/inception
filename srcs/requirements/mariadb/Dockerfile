FROM debian:bullseye

RUN apt update && \
    apt install -y mariadb-server && \
    apt clean && rm -rf /var/lib/apt/lists/*

EXPOSE 3306

CMD ["mysqld"]
