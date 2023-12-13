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
	"$M, L, exec, gtklock"

        # Focus Movement
        "$M, left, movefocus, l"
        "$M, right, movefocus, r"
        "$M, up, movefocus, u"
        "$M, down, movefocus, d"

        # Window Movement
        "$M SHIFT, left, movewindow, l"
        "$M SHIFT, right, movewindow, r"
        "$M SHIFT, up, movewindow, u"
        "$M SHIFT, down, movewindow, d"

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
        "$M SHIFT, S, exec, grim -g \"\$(slurp)\" - | wl-copy -t image/png && wl-paste -t image/png > \$(xdg-user-dir PICTURES)/screenshots/\$(date +'%Y-%m-%d-%H%M%S.png')"

	# Function key alt binds
	## Function Lock Toggle
	", XF86AudioMute, exec, pamixer --toggle-mute"
	", XF86AudioRaiseVolume, exec, pamixer --increase 5"
	", XF86AudioLowerVolume, exec, pamixer --decrease 5"
	", XF86AudioMicMute, exec, pamixer --default-source --toggle-mute"
	", XF86AudioPlay, exec, playerctl play-pause"
	## Keyboard Backlight Control (0%/50%/100%)
	", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
	", XF86MonBrightnessUp, exec, brightnessctl set +5%"
	## Super+P / XF86Display
	## Printscreen
	## Home
	## End
	## Insert
			];
      bindm = [
        "$M, mouse:272, movewindow"
        "$M, mouse:273, resizewindow"
      ];
    };
  };
}
