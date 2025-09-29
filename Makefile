.DEFAULT_GOAL:=help
-include .makerc

# --- Config -----------------------------------------------------------------

# Newline hack for error output
define br


endef

# --- Targets -----------------------------------------------------------------

# This allows us to accept extra arguments
%: go.work
	@:

# Ensure go.work file
go.work:
	@go work init
	@go work use -r .
	@go mod tidy

.PHONY: tidy
## Run go mod tidy
tidy:
	@go mod tidy

.PHONY: lint
## Run go lint
lint:
	@golangci-lint run

.PHONY: test
## Run go test
test:
	@GO_TEST_TAGS=-skip go test -tags=safe -coverprofile=coverage.out -race work

.PHONY: release
## Create release TAG=1.0.0
release:
ifndef TAG
	$(error $(br)$(br)TAG variable is required.$(br)Usage: make release TAG=1.0.0$(br)$(br))
endif
	@echo "Create release tags:"
	@echo "- v$(TAG)"
	@git tag v$(TAG)
	@find . -name 'go.mod' -mindepth 2 -maxdepth 2 | while read modfile; do \
		modname=$$(basename $$(dirname $$modfile)); \
		echo "- $$modname/v$(TAG)"; \
		git tag "$$modname/v$(TAG)"; \
	done

### Utils

.PHONY: help
## Show help text
help:
	@echo "Go Monorepo Playground (sesamy)\n"
	@echo "Usage:\n  make [task]"
	@awk '{ \
		if($$0 ~ /^### /){ \
			if(help) printf "%-23s %s\n\n", cmd, help; help=""; \
			printf "\n%s:\n", substr($$0,5); \
		} else if($$0 ~ /^[a-zA-Z0-9._-]+:/){ \
			cmd = substr($$0, 1, index($$0, ":")-1); \
			if(help) printf "  %-23s %s\n", cmd, help; help=""; \
		} else if($$0 ~ /^##/){ \
			help = help ? help "\n                        " substr($$0,3) : substr($$0,3); \
		} else if(help){ \
			print "\n                        " help "\n"; help=""; \
		} \
	}' $(MAKEFILE_LIST)
