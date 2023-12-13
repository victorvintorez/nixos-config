{ config, pkgs, outputs, ... }: {
  imports = [
    ./ags
    ./hyprland
    ./jetbrains
    ./platform
    ./rofi
    ./swww
	./vscode
   ./waybar 
    ./firefox.nix
    ./gtklock.nix
	./kitty.nix
	./mpv.nix
	./photoqt.nix
	./spicetify.nix
#	./thunderbird.nix
  ] ++ (builtins.attrValues outputs.modules);

  home.packages = with pkgs; [
    cliphist
    wl-clipboard
    brightnessctl
    grim
    slurp
    wf-recorder
    libnotify
    xdg-utils
    inotify-tools
    gnome.file-roller
  ];
}
