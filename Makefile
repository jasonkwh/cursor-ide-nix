.PHONY: help update
.DEFAULT_GOAL := flake.lock

help:
	@printf '%s\n' \
		'make              write flake.lock from flake.nix' \
		'make update       refresh the locked nixpkgs input'

flake.lock: flake.nix
	nix flake lock
	touch $@

update:
	nix flake update
