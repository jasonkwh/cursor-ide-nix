.PHONY: update
.DEFAULT_GOAL := update

update:
	nix flake update
