{ config, pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
    };
    style = builtins.readFile ./style.css;
  };

  xdg.configFile."waybar/config".source =  config.lib.file.mkOutOfStoreSymlink "${./config}";

  xdg.configFile."scripts/randwall.sh".source = pkgs.writeShellScript "randwall" builtins.readFile ./randwall.sh;
  xdg.configFile."scripts/volume.sh".source = pkgs.writeShellScript "volume" builtins.readFile ./volume.sh;

  home.packages = with pkgs; [
    playerctl
    networkmanagerapplet
    pamixer
  ];
}