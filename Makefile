.PHONY: dev build start precommit precommit_fix sidebar_check help

ENV ?= development

start:  ## Start Docusaurus site (default: ENV=development)
	ENV=$(ENV) bash scripts/create_docusaurus_website.sh

dev:  ## Alias to start in development mode
	ENV=development bash scripts/create_docusaurus_website.sh

build:  ## Alias to start in production mode
	ENV=production bash scripts/create_docusaurus_website.sh

precommit:  ## Run docs precommit checks
	make -C readmes precommit

precommit_fix:  ## Try to fix existing precommit issues
	make -C readmes precommit_fix

sidebar_check:  ## Check if all pages are implemented with sidebars
	python3 scripts/check_sidebars.py

help:  ## Show documented commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-25s\033[0m %s\n", $$1, $$2}'
