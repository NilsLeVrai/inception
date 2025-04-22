all:
	@mkdir -p /home/niabraha/data/wordpress
	@mkdir -p /home/niabraha/data/mariadb
	docker-compose -f /home/niabraha/Documents/cursus/inception/srcs/docker-compose.yml build

down:
	docker-compose -f /home/niabraha/Documents/cursus/inception/srcs/docker-compose.yml down

build:
	docker-compose -f /home/niabraha/Documents/cursus/inception/srcs/docker-compose.yml build

restart:
	make down
	make up

logs:
	docker-compose -f /home/niabraha/Documents/cursus/inception/srcs/docker-compose.yml logs -f

fclean: 
	@docker-compose -f srcs/docker-compose.yml kill
	@docker-compose -f srcs/docker-compose.yml rm -f
	@docker system prune -a --volumes -f

.PHONY: all up down build restart logs fclean


