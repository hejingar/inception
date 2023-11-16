all:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker network rm $$(docker network ls -q);\
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d

build: 
	mkdir -p /home/ael-youb/data/mariadb
	chmod -R 777 /home/ael-youb/data/mariadb
	mkdir -p /home/ael-youb/data/wordpress
	chmod -R 777 /home/ael-youb/data/wordpress
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d

up:
	docker compose -f ./srcs/docker-compose.yml up -d

logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

clean:
	docker container stop nginx mariadb wordpress
	docker network rm inception

# @sudo rm -rf /home/ael-youb/data/mariadb/*
# @sudo rm -rf /home/ael-youb/data/wordpress/*
fclean: clean
	docker system prune -af

re: fclean all

.Phony: all logs clean fclean