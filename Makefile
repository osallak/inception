COMPOSE-PATH=srcs/docker-compose.yml
USER=osallak

DATA=/home/$(USER)/data
GREEN = \033[0;32m
NC = \033[0m
ORANGE = \033[0;33m

all: build up

build: 
	@docker compose -f $(COMPOSE-PATH) build

$(DATA):
	mkdir -p /home/$(USER)/data/wp;
	mkdir -p /home/$(USER)/data/mariadb;
	echo "$(GREEN)Created data folder$(NC)";

up: down $(DATA) 
	@docker compose -f $(COMPOSE-PATH) up -d 

down:
	@docker compose -f $(COMPOSE-PATH) down

clean: down
	@docker compose -f $(COMPOSE-PATH) down --volumes  
	@docker image prune -a --force
	@docker system prune --all --volumes --force

fclean: clean
	@echo "$(ORANGE)WARNING$(NC): This will delete all your data, (requires root privileges)"
	@echo "Press enter to continue or CTRL+C to cancel"
	@read  reply
	@sudo rm -rf /home/$(USER)/data
	@echo "$(GREEN)Data folder deleted$(NC)"
