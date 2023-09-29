{ config, pkgs, outputs, ... }: {
  imports = [
    ./ags
    ./hyprland
    ./platform
    ./rofi
	  ./vscode
    ./swww
    ./gtklock.nix
  	./kitty.nix
	  ./schizofox.nix
  ] ++ (builtins.attrValues outputs.modules);

  home.packages = with pkgs; [
    cliphist
    wl-clipboard
    brightnessctl
    wayshot
    swappy
    slurp
    wf-recorder
    libnotify
    xdg-utils
    inotify-tools
    libreoffice
  ];
}
