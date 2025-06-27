COMPOSE = ./srcs/docker-compose -f docker-compose.yml

all:
	@mkdir -p /home/niabraha/data/wordpress
	@mkdir -p /home/niabraha/data/mariadb
	$(COMPOSE) build
	$(COMPOSE) up -d

up:
	@mkdir -p /home/niabraha/data/wordpress
	@mkdir -p /home/niabraha/data/mariadb
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

build:
	@mkdir -p /home/niabraha/data/wordpress
	@mkdir -p /home/niabraha/data/mariadb
	$(COMPOSE) build

restart:
	make down
	make up

logs:
	$(COMPOSE) logs -f

fclean:
	@docker compose kill || true
	@docker compose rm -f || true
	@docker rm -f $$(docker ps -aq) 2>/dev/null || true
	@docker volume rm $$(docker volume ls -q) 2>/dev/null || true
	@docker system prune -a --volumes -f


.PHONY: all up down build restart logs fclean
