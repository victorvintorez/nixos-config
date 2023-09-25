{ config, pkgs, ... }: {
	programs.rofi = {
		enable = true;
		package = pkgs.rofi-wayland;
		cycle = false;
		font = "Iosevka Nerd Font";
		location = "center";
		terminal = "kitty";
		theme = ./theme.rasi;
		extraConfig = {
			modi = "run,drun,window";
			icon-theme = "Oranchelo";
			show-icons = true;
			drun-display-format = "~~> {icon} | {name}";
			disable-history = true;
			hide-scrollbar = true;
			display-drun = "  Apps ";
			display-run = "  Run ";
			display-window = " 󰧨 Window ";
			display-network = " 󰢩 Network ";
		};
	};
}
