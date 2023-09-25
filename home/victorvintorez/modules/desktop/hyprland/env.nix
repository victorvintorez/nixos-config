{ config, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    settings = {
      env = [
        "XCURSOR_SIZE,24"
        "KITTY_ENABLE_WAYLAND,1"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SESSION_TYPE,wayland"
      ];
    };
  };
}