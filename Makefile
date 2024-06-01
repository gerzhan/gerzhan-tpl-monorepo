.DEFAULT_GOAL := help

VERSION = $(shell node -e 'console.log(require("./package.json").version)')

MAKEFILE_LIST = Makefile
THIS_DIR := $(dir $(abspath $(firstword $(MAKEFILE_LIST))))

# NOTE: самодокументирование команд makefile
help: ## help - отображение списка доступных команд
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'

root_version: ## root_version - текущая версия корневого package.json
	@printf "%s\n" "$(VERSION)"
