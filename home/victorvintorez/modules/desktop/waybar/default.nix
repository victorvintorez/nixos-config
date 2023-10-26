{ config, pkgs, lib, ... }: let 
  randwall = (pkgs.writeShellScript "randwall" ''
    export SWWW_TRANSITION_FPS=61
    export SWWW_TRANSITION_STEP=2

    find "~/.config/wallpapers" |
	    shuf -n 1 | while read -r img; do ${pkgs.swww} img "$img" -o eDP-1; done
  '').outPath;
  volume = (pkgs.writeShellScript "volume" ''
    down() {
      ${pkgs.pamixer} -d 5
      volume=$(${pkgs.pamixer} --get-volume)
      [$volume -gt 0 ] && volume=`expr $volume`  
    }

    up() {
      ${pkgs.pamixer} -i 5
      volume=$(${pkgs.pamixer} --get-volume)
      [ $volume -lt 100 ] && volume=`expr $volume`  
    }

    mute() {
      muted="$(${pkgs.pamixer} --get-mute)"
      if $muted; then
        ${pkgs.pamixer} -u
      else 
        ${pkgs.pamixer} -m
      fi
    }

    case "$1" in
      up) up;;
      down) down;;
      mute) mute;;
    esac
  '').outPath;
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
    pkgs.pamixer
  ];
}