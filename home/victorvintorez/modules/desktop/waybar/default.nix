{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
    };
    style = builtins.readFile ./style.css;
  };

  xdg.configFile."waybar/config".source = config.lib.file.mkOutOfStoreSymlink "${./config}";

  xdg.configFile."scripts/randwall.sh".source = config.lib.file.mkOutOfStoreSymlink "${./randwall.sh}";
  xdg.configFile."scripts/volume".source = config.lib.file.mkOutOfStoreSymlink "${./volume}";

  home.packages = with pkgs; [
    playerctl
    networkmanagerapplet
    pamixer
  ];
}