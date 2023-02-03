.DEFAULT_GOAL := default

default: help

.PHONY: update
update: tree ## 更新
	@-echo "\033[32m =====> Updating ..."
	@-git add .
	@-git commit -m "📝 Update"
	@-git push -u origin main
	@-echo "\033[32m =====> Done ..."

.PHONY: tree
tree: ## 更新 tree
	@-echo "\033[32m =====> Updating ..."
	@-echo '```' > Tree.md
	@-tree >> Tree.md
	@-echo '```' >> Tree.md	
	@-echo "\033[32m =====> Done ..."

.PHONY: help
help: Makefile ## 打印 Makefile help 信息.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<TARGETS>\033[0m\n\n\033[35mTargets:\033[0m\n"} /^[0-9A-Za-z._-]+:.*?##/ { printf "  \033[36m%-45s\033[0m %s\n", $$1, $$2 } /^\$$\([0-9A-Za-z_-]+\):.*?##/ { gsub("_","-", $$1); printf "  \033[36m%-45s\033[0m %s\n", tolower(substr($$1, 3, length($$1)-7)), $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' Makefile #$(MAKEFILE_LIST)