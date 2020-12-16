.PHONY:
help:
	@echo Tasks:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.PHONY:
run: ## Start Registry docker containers
	@docker-compose up

.PHONY:
stop: ## Stop Registry docker containers
	@docker-compose stop
	
.PHONY:
restart: stop run ## Restart Registry docker containers

.PHONY:
clean: ## Stop and remove Registry docker containers and images
	@docker-compose down || true
