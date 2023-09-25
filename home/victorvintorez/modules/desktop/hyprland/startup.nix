{ config, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "gtklock"
        "wl-paste --type text --watch cliphist store"
        "wl-paste -p --watch wl-copy -pc"
      ];
    };
  };
}