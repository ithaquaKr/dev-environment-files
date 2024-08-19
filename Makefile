# Makefile for dev-environment-files
#

# Variables from command line.

# Internal variables.
DOTFILES = $(pwd -P)
OS = $(uname)
SUPPORT_INSTALL = homebrew zsh
CONFIG_LIST = zsh jgit neofetch nvim skhd starship tmux wezterm yabai mise
###############################################
##@ General

# The help target prints out all targets with their descriptions organized
# beneath their categories. The categories are represented by '##@' and the
# target descriptions by '##'. The awk commands is responsible for reading the
# entire set of makefiles included in this invocation, looking for lines of the
# file as xyz: ## something, and then pretty-format the target and help. Then,
# if there's a line with ##@ something, that gets pretty-printed as a category.
# More info on the usage of ANSI control characters for terminal formatting:
# https://en.wikipedia.org/wiki/ANSI_escape_code#SGR_parameters
# More info on the awk command:
# http://linuxcommand.org/lc3_adv_awk.php

.PHONY: help
help: ## Display this help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: setup
setup: ## Install and configure all tools automatically
	@./scripts/setup.sh

.PHONY: list
list: ## List of configurations that can be applied.
	@echo "\nAvailable configurations:"
	@echo "$(CONFIG_LIST)" | tr ' ' '\n' | sort | while read config; do \
			printf "  - %s\n" $$config; \
	done

.PHONY: apply
apply: ## Apply configuration.
	@echo "Error: Configuration '' doesn't exist."; \


.PHONY: remove
remove: ## Remove configuration.
	@./

##@ Support
.PHONY: install
install: ## 
	@./scripts/install_homebrew.sh $(DOTFILES)

.PHONY: font
font: ## Install Font by name
	@echo "addfonat"
