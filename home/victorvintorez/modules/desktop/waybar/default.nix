{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
    };
    style = builtins.readFile ./style.css;
  };

  xdg.configFile."waybar/config".source = ./config;

  xdg.configFile."scripts/randwall.sh".source = ./randwall.sh;
  xdg.configFile."scripts/volume".source = ./volume;

  home.packages = with pkgs; [
    playerctl
    networkmanagerapplet
    pamixer
  ];
}