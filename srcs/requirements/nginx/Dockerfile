FROM debian:bullseye

RUN apt update; apt install nginx -y; apt install openssl -y

CMD ["nginx", "-g", "daemon off;"]
