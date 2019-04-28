.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@# credits to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

help-more: ## Show more rare commands
	@grep -E '^[a-zA-Z_-]+:.*?### .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?### "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


build: export COMPOSE_PROJECT_NAME = ${subst /,_,$(shell pwd)}
build: ## Run pip-compile
	bash -c " \
	  docker-compose build; \
	  docker-compose down \
	  "

run-tests: export COMPOSE_PROJECT_NAME = ${subst /,_,$(shell pwd)}
run-tests: ## Run tests locally
	bash -c " \
	  docker-compose run --entrypoint python app -m tests.tests; \
	  docker-compose down \
	  "

pip-compile: export COMPOSE_PROJECT_NAME = ${subst /,_,$(shell pwd)}
pip-compile: ## Run pip-compile
	bash -c " \
	  docker-compose run --entrypoint sh app -c 'pip install pip-tools; pip-compile'; \
	  docker-compose down \
	  "

