{ config, pkgs, lib, ... }: let 
  randwall = (pkgs.${pkgs.system}.writeShellScript "randwall" builtins.readFile ./randwall.sh).outPath;
  volume = (pkgs.${pkgs.system}.writeShellScript "volume" builtins.readFile ./volume.sh).outPath;
in {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
    };
    style = builtins.readFile ./style.css;
  };

  xdg.configFile."waybar/config".source =  config.lib.file.mkOutOfStoreSymlink "${./config}";

  xdg.configFile."scripts/randwall.sh".source = randwall;
  xdg.configFile."scripts/volume.sh".source = volume;

  home.packages = with pkgs; [
    playerctl
    networkmanagerapplet
    pamixer
  ];
}