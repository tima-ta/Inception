
COMPOSE_FILE := srcs/docker-compose.yml

.DEFAULT_GOAL := up

# colors
NORMAL		=	\e[0m
PURPLE		= 	\e[1;35m

up:
	@printf "$(PURPLE) 	- Build and start the services $(NORMAL)\n"
	sudo mkdir -p /home/fraqioui/data/mdb
	sudo mkdir -p /home/fraqioui/data/wdp
	@ docker-compose -f $(COMPOSE_FILE) up -d

ls:
	@printf "$(PURPLE) 	- List all services $(NORMAL)\n"
	@ docker-compose  -f $(COMPOSE_FILE) ps

down:
	@printf "$(PURPLE) 	- Stop and Remove all services $(NORMAL)\n"
	@ docker-compose -f $(COMPOSE_FILE) down

clean:
	@printf "$(PURPLE) 	- Stop and Remove all services && Clean everything else :: Network, volumes, images ... $(NORMAL)\n"
	@ docker-compose -f $(COMPOSE_FILE) down -v
	@ if [ -n "$$(docker ps -q)" ]; then docker stop $$(docker ps -q); fi
	@ docker volume prune -f
	@ docker system prune -af
	sudo rm -rf /home/fraqioui/data/* 

re: clean up

.PHONY: up ls down clean
