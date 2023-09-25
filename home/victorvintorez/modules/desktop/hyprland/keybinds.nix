{ config, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    settings = {
      "$M" = "SUPER";
			bind = [
				# Window Management Binds
				"$M, C, killactive"
        "$M, M, exit"
        "$M, Tab, togglefloating"
        "$M, F, fullscreen"
        "$M, P, pseudo"
        "$M, J, togglesplit"

        # Focus Movement
        "$M, left, movefocus, l"
        "$M, right, movefocus, r"
        "$M, up, movefocus, u"
        "$M, down, movefocus, d"

        # Window Movement
        "$M, left, movewindow, l"
        "$M, right, movewindow, r"
        "$M, up, movewindow, u"
        "$M, down, movewindow, d"

        # Switch Workspaces
        "$M, 1, workspace, 1"
        "$M, 2, workspace, 2"
        "$M, 3, workspace, 3"
        "$M, 4, workspace, 4"
        "$M, 5, workspace, 5"
        "$M, 6, workspace, 6"
        "$M, 7, workspace, 7"
        "$M, 8, workspace, 8"
        "$M, 9, workspace, 9"
        "$M, 0, workspace, 10"

        # Move window to workspace
        "$M SHIFT, 1, movetoworkspace, 1"
        "$M SHIFT, 2, movetoworkspace, 2"
        "$M SHIFT, 3, movetoworkspace, 3"
        "$M SHIFT, 4, movetoworkspace, 4"
        "$M SHIFT, 5, movetoworkspace, 5"
        "$M SHIFT, 6, movetoworkspace, 6"
        "$M SHIFT, 7, movetoworkspace, 7"
        "$M SHIFT, 8, movetoworkspace, 8"
        "$M SHIFT, 9, movetoworkspace, 9"
        "$M SHIFT, 0, movetoworkspace, 10"

        # Scroll through workspaces
        "$M, mouse_down, workspace, e+1"
        "$M, mouse_up, workspace, e-1"

        # Application Binds
        "$M, Q, exec, kitty"
        "$M, E, exec, thunar"

        # Rofi Binds
        "$M, R, exec, rofi -show run"
				"$M, Space, exec, rofi -show drun"
        "$M, V, exec, cliphist | rofi -dmenu | cliphist decode | wl-copy"
			];
    };
  };
}