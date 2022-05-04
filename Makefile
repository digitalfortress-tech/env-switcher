# Define colors
BK="tput setaf 0"
RD="tput setaf 1"
GN="tput setaf 2"
YW="tput setaf 3"
BL="tput setaf 4"
MG="tput setaf 5"
CY="tput setaf 6"
WT="tput setaf 7"
bold="tput bold"

# Define Functions

define reset_colors
  tput sgr0 && "${GN}" && tput el
endef

define logText
  tput bold && "${YW}"
endef

define highlightText
  tput bold && "${CY}" && tput setab 4
endef

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

info: ## Show Quasar help
	@yarn quasar help

install: ## Install Dependencies
	@$(call logText) && echo "*** Installing Dependencies ***" && $(call reset_colors)
	@npm i
	@$(call highlightText) && echo "*** Deps installed. Start Dev - make watch" && $(call reset_colors)

watch:  ## Build App for Dev Env
	@$(call logText) && echo "*** Building App for Dev ***" && $(call reset_colors)
	yarn quasar dev

watchBex:  ## Build App for BEX Mode
	@$(call logText) && echo "*** Building App for BEX ***" && $(call reset_colors)
	yarn quasar dev -m bex

################## Recipes explicitly for Production ####################

prod:	## Build App for Production environment
	@$(call logText) && echo "*** Building App for Production ***" && $(call reset_colors)
	yarn quasar build

prodBex:	## Build BEX for Production environment
	@$(call logText) && echo "*** Building BEX for Production ***" && $(call reset_colors)
	yarn quasar build -m bex
