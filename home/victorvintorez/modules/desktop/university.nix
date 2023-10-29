{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    libreoffice
    drawio
    obsidian-wayland
  ];
}
