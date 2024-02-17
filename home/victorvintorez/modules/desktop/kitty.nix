{ config, pkgs, inputs, ... }: {
	 programs.kitty = {
 		enable = true;
		settings = {
			# Theme
			foreground = "#${config.colorScheme.palette.base05}";
			background = "#${config.colorScheme.palette.base00}";
			selection_foreground = "#${config.colorScheme.palette.base00}";
			selection_background = "#${config.colorScheme.palette.base06}";
			cursor = "#${config.colorScheme.palette.base06}";
			cursor_text_color = "#${config.colorScheme.palette.base00}";
			url_color = "#${config.colorScheme.palette.base06}";
			active_border_color = "#${config.colorScheme.palette.base07}";
			inactive_border_color = "#${config.colorScheme.palette.base04}";
			bell_border_color = "#${config.colorScheme.palette.base06}";
			wayland_titlebar_color = "system";
			macos_titlebar_color = "system";
			active_tab_foreground = "#${config.colorScheme.palette.base00}";
			active_tab_background = "#${config.colorScheme.palette.base05}";
			inactive_tab_foreground = "#${config.colorScheme.palette.base05}";
			inactive_tab_background = "#${config.colorScheme.palette.base01}";
			tab_bar_background = "#${config.colorScheme.palette.base00}";
			mark1_foreground = "#${config.colorScheme.palette.base00}";
			mark1_background = "#${config.colorScheme.palette.base07}";
			mark2_foreground = "#${config.colorScheme.palette.base00}";
			mark2_background = "#${config.colorScheme.palette.base05}";
			mark3_foreground = "#${config.colorScheme.palette.base00}";
			mark3_background = "#${config.colorScheme.palette.base0C}";

			# Terminal Colors
			# black
			color0 = "#${config.colorScheme.palette.base00}";
			color8 = "#${config.colorScheme.palette.base01}";
			# red
			color1 = "#${config.colorScheme.palette.base08}";
			color9 = "#${config.colorScheme.palette.base08}";
			# green
			color2 = "#${config.colorScheme.palette.base0B}";
			color10 = "#${config.colorScheme.palette.base0B}";
			# yellow
			color3 = "#${config.colorScheme.palette.base0A}";
			color11 = "#${config.colorScheme.palette.base0A}";
			# blue
			color4 = "#${config.colorScheme.palette.base0D}";
			color12 = "#${config.colorScheme.palette.base0D}";
			# magenta
			color5 = "#${config.colorScheme.palette.base0E}";
			color13 = "#${config.colorScheme.palette.base0E}";
			# cyan
			color6 = "#${config.colorScheme.palette.base0C}";
			color14 = "#${config.colorScheme.palette.base0C}";
			# white
			color7 = "#${config.colorScheme.palette.base05}";
			color15 = "#${config.colorScheme.palette.base05}";

			# Font Config
			font_family = "Iosevka Term";
			disable_ligatures = "never";

			# Other Config
			cursor_shape = "beam";
			window_padding_width = "5 0 2";
		};
		shellIntegration = {
			enableFishIntegration = true;
		};
	};
}
