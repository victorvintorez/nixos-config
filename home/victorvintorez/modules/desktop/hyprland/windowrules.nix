{ config, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        # Hide xwayland screenshare fix
        "opacity 0.0 override 0.0 override, class:^(xwaylandvideobridge)$"
        "noanim, class:^(xwaylandvideobridge)$"
        "nofocus, class:^(xwaylandvideobridge)$"
        "noinitialfocus, class:^(xwaylandvideobridge)$"

        # Fix for jetbrains spawning windows all the time
        "noanim, class:^(xwaylandvideobridge)$"
        "noinitialfocus, class:^(win)*.$"

        # Floating windows by default
        "float, class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "float, class:^(pavucontrol)$"
        "float, title:^(Picture-in-Picture)$"
        "float, class:^(confirm)$"
        "float, class:^(dialog)$"
        "float, class:^(download)$"
        "float, class:^(notification)$"
        "float, class:^(error)$"
        "float, class:^(confirmreset)$"
        "float, title:^(Open File)$"
        "float, title:^(branchdialog)$"
        "float, title:^(Confirm to replace files)"
        "float, title:^(File Operation Progress)"
      ];
    };
  };
}