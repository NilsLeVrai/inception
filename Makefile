COMPOSE = docker-compose -f /home/niabraha/Documents/cursus/inception/srcs/docker-compose.yml

all:
	@mkdir -p /home/niabraha/data/wordpress
	@mkdir -p /home/niabraha/data/mariadb
	$(COMPOSE) build

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
	@$(COMPOSE) kill
	@$(COMPOSE) rm -f
	@docker system prune -a --volumes -f

.PHONY: all up down build restart logs fclean
