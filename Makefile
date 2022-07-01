.DEFAULT_GOAL:=help
SHELL:=/bin/bash

.PHONY: build  run
run: ## Run the server with GraphQL
	go run server.go

build: ## Build the server
	mkdir -p artifacts
	go build -o artifacts/server

.PHONY: go-generate
go-generate: ## Generate the code from specification
	go run github.com/99designs/gqlgen generate

.PHONY: todo-create todo-read
todo-create: ## Create a todo entry
	bash spec/create.sh

todo-read: ## Read the TODO list
	bash spec/read.sh

.PHONY: help
help: ## Display this help message
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)