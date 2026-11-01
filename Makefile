update:
	nix flake update $(flake)

rebuild:
	git add .
	sudo --preserve-env=SSH_AUTH_SOCK nixos-rebuild switch

test:
	git add .
	sudo --preserve-env=SSH_AUTH_SOCK nixos-rebuild test