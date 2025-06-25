#!/bin/bash
set -ex
cd /var/www/html

if ! wp core is-installed --allow-root; then
    rm -rf ./*
    wp core download --allow-root
    wp config create    --dbname="$WORDPRESS_NAME" \
                        --dbuser="$WORDPRESS_USER" \
                        --dbpass="$WORDPRESS_PASSWORD" \
                        --dbhost="$WORDPRESS_HOST" \
                        --allow-root
    wp config set WP_CACHE true --raw --allow-root
    wp core install --url="$DOMAIN_NAME" --title="$WORDPRESS_TITLE" \
                --admin_user="$WORDPRESS_ADMIN_USER" \
                --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
                --admin_email="$WORDPRESS_ADMIN_EMAIL" --allow-root
    wp user create "$WORDPRESS_USER_NAME" "$WORDPRESS_USER_EMAIL" --role=author --user_pass="$WORDPRESS_USER_PASSWORD" --allow-root
    chown -R www-data:www-data /var/www/html
fi
cd;

php-fpm7.4 -F --nodaemonize --fpm-config /etc/php/7.4/fpm/php-fpm.conf