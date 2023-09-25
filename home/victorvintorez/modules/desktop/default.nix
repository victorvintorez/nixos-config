{ config, pkgs, outputs, ... }: {
  imports = [
    ./ags
    ./hyprland
    ./rofi
	  ./vscode
    ./dunst.nix
  	./kitty.nix
	  ./schizofox.nix
  ] ++ (builtins.attrValues outputs.modules);

  home.packages = with pkgs; [
    cliphist
    wl-clipboard
  ];
}
