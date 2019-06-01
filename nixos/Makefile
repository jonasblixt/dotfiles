NIXOS_CONFIG=$(shell dirname ~/dotfiles)/dotfiles/nixos/configuration.nix
switch:
	@sudo nixos-rebuild -I nixos-config=$(NIXOS_CONFIG) switch

upgrade:
	@sudo nixos-rebuild -I nixos-config=$(NIXOS_CONFIG) switch --upgrade
