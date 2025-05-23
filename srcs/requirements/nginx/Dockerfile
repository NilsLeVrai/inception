FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt \
	-subj "/C=FR/ST=Paris/L=Paris/O=42/OU=Inception/CN=localhost"

COPY nginx.conf /etc/nginx/sites-available/default

EXPOSE 4443

CMD ["nginx", "-g", "daemon off;"]
