{ config, pkgs, ... }: {
  imports = [
    ./hyprland
	./kitty.nix
	./schizofox.nix
	./vscode
  ];
}
