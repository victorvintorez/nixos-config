{ config, pkgs, outputs, ... }: {
  imports = [
    ./ags
    ./hyprland
    ./platform
    ./rofi
	  ./vscode
    ./dunst.nix
    ./gtklock.nix
  	./kitty.nix
	  ./schizofox.nix
  ] ++ (builtins.attrValues outputs.modules);

  home.packages = with pkgs; [
    cliphist
    wl-clipboard
  ];
}
