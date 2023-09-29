{ config, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "ags"
        "wl-paste --type text --watch cliphist store"
        "wl-paste -p --watch wl-copy -pc"
        "gtklock"
      ];
    };
  };
}