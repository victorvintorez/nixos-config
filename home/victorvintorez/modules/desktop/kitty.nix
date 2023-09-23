{ config, pkgs, inputs, ... }: {
	 programs.kitty = {
 		enable = true;
		theme = "Catppuccin-Mocha";
		settings = {
			font_family = "Iosevka Term";
			window_padding_width = 10;
		};
		shellIntegration = {
			enableFishIntegration = true;
		};
	};
}
