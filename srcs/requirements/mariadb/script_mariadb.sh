#!/bin/bash

chown -R mysql:mysql /var/lib/mysql
chown -R mysql:mysql /run/mysqld

if [ ! -d "/var/lib/mysql/mysql" ]; then
  echo "Initializing database..."
  mysql_install_db --user=mysql --ldata=/var/lib/mysql
fi

mysqld_safe --datadir=/var/lib/mysql &
sleep 5

# Sécurité : s'assure que les variables sont définies
if [ -n "$WORDPRESS_USER" ] && [ -n "$WORDPRESS_PASSWORD" ] && [ -n "$WORDPRESS_NAME" ]; then
    echo "CREATE DATABASE IF NOT EXISTS ${WORDPRESS_NAME} ;" | mariadb

    # Création utilisateur pour l'hôte 'wordpress' (nom du conteneur dans le réseau Docker)
    echo "CREATE USER IF NOT EXISTS '${WORDPRESS_USER}'@'wordpress' IDENTIFIED BY '${WORDPRESS_PASSWORD}' ;" | mariadb
    echo "GRANT ALL PRIVILEGES ON ${WORDPRESS_NAME}.* TO '${WORDPRESS_USER}'@'wordpress' ;" | mariadb

    # En bonus : si besoin de compatibilité large
    echo "CREATE USER IF NOT EXISTS '${WORDPRESS_USER}'@'%' IDENTIFIED BY '${WORDPRESS_PASSWORD}' ;" | mariadb
    echo "GRANT ALL PRIVILEGES ON ${WORDPRESS_NAME}.* TO '${WORDPRESS_USER}'@'%' ;" | mariadb

    echo "FLUSH PRIVILEGES;" | mariadb
fi

mysqladmin shutdown

exec mysqld_safe --datadir=/var/lib/mysql
