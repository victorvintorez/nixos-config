{ config, pkgs, inputs, ... }: {
	 programs.kitty = {
 		enable = true;
		settings = {
			# Theme
			foreground = "#${config.colorScheme.colors.base05}";
			background = "#${config.colorScheme.colors.base00}";
			selection_foreground = "#${config.colorScheme.colors.base00}";
			selection_background = "#${config.colorScheme.colors.base06}";
			cursor = "#${config.colorScheme.colors.base06}";
			cursor_text_color = "#${config.colorScheme.colors.base00}";
			url_color = "#${config.colorScheme.colors.base06}";
			active_border_color = "#${config.colorScheme.colors.base07}";
			inactive_border_color = "#${config.colorScheme.colors.base04}";
			bell_border_color = "#${config.colorScheme.colors.base06}";
			wayland_titlebar_color = "system";
			macos_titlebar_color = "system";
			active_tab_foreground = "#${config.colorScheme.colors.base00}";
			active_tab_background = "#${config.colorScheme.colors.base05}";
			inactive_tab_foreground = "#${config.colorScheme.colors.base05}";
			inactive_tab_background = "#${config.colorScheme.colors.base01}";
			tab_bar_background = "#${config.colorScheme.colors.base00}";
			mark1_foreground = "#${config.colorScheme.colors.base00}";
			mark1_background = "#${config.colorScheme.colors.base07}";
			mark2_foreground = "#${config.colorScheme.colors.base00}";
			mark2_background = "#${config.colorScheme.colors.base05}";
			mark3_foreground = "#${config.colorScheme.colors.base00}";
			mark3_background = "#${config.colorScheme.colors.base0C}";

			# Terminal Colors
			# black
			color0 = "#${config.colorScheme.colors.base00}";
			color8 = "#${config.colorScheme.colors.base01}";
			# red
			color1 = "#${config.colorScheme.colors.base08}";
			color9 = "#${config.colorScheme.colors.base08}";
			# green
			color2 = "#${config.colorScheme.colors.base0B}";
			color10 = "#${config.colorScheme.colors.base0B}";
			# yellow
			color3 = "#${config.colorScheme.colors.base0A}";
			color11 = "#${config.colorScheme.colors.base0A}";
			# blue
			color4 = "#${config.colorScheme.colors.base0D}";
			color12 = "#${config.colorScheme.colors.base0D}";
			# magenta
			color5 = "#${config.colorScheme.colors.base0E}";
			color13 = "#${config.colorScheme.colors.base0E}";
			# cyan
			color6 = "#${config.colorScheme.colors.base0C}";
			color14 = "#${config.colorScheme.colors.base0C}";
			# white
			color7 = "#${config.colorScheme.colors.base05}";
			color15 = "#${config.colorScheme.colors.base05}";

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
