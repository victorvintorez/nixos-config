{ config, pkgs, ... }: {
  imports = [
    ./hyprland
    ./rofi
	  ./vscode
    ./dunst.nix
  	./kitty.nix
	  ./schizofox.nix
  ];

  home.packages = with pkgs; [
    cliphist
    wl-clipboard
  ];
}
