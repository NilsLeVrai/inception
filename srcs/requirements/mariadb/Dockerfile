FROM debian:bookworm

RUN apt update && \
    apt install -y mariadb-server

# Copy custom MariaDB config if needed
COPY ./mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./script_mariadb.sh /

# Create the mysqld runtime dir and fix permissions
RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

EXPOSE 3306

# Initialize database if it doesn't exist
ENTRYPOINT ["/script_mariadb.sh"]
