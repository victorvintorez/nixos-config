{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
    };
    style = builtins.readFile ./style.css;
    settings = lib.importJSON ./config.json;
  };



  home.packages = with pkgs; [
    playerctl
    network-manager-applet
    pamixer
  ];
}