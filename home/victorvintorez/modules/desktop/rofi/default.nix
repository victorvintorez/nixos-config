{ config, pkgs, ... }: {
	programs.rofi = {
		enable = true;
		package = pkgs.rofi-wayland;
		cycle = false;
		font = "Iosevka Term";
		location = "center";
		terminal = "${pkgs.kitty}/bin/kitty";
		theme = "Catppuccin-Mocha";
	};
}
