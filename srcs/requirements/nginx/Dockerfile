FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt \
	-subj "/C=FR/ST=Paris/L=Paris/O=42/OU=Inception/CN=niabraha.42.fr"

RUN mkdir -p etc/nginx/ssl && \
	mkdir -p /var/run/nginx && \
	mkdir -p /var/www/html

COPY nginx.conf /etc/nginx/nginx.conf
COPY hosts /etc/hosts

RUN chown -R www-data:www-data /var/www/html && \
	chown -R www-data:www-data /var/run/nginx

RUN chmod -R 755 /var/www/html && \
	chmod 755 /var/run/nginx

CMD ["nginx", "-g", "daemon off;"]
