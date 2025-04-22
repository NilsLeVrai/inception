

all: up

up:
	@mkdir -p /home/niabraha/srcs
	@mkdir -p /home/niabraha/srcs/mariadb
	@mkdir -p /home/niabraha/srcs/wordpress
	docker-compose -f /home/niabraha/inception/docker-compose.yml up -d

down:
	docker-compose -f /home/niabraha/inception/docker-compose.yml down

build:
	docker-compose -f /home/niabraha/inception/docker-compose.yml build

restart:
	make down
	make up

logs:
	docker-compose -f /home/niabraha/inception/docker-compose.yml logs -f

clean: down
	@echo "Cleaning volumes and files..."
	sudo rm -rf /home/niabraha/inception

.PHONY: all up down build restart logs clean


