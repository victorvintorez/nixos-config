{ config, pkgs, ... }: {
	programs.mpv = {
		enable = true;
		scripts = with pkgs.mpvScripts; [
			mpris
			autoload
			thumbfast
			uosc
		];
		config = {
			osc = false;
			osd-bar = false;
			border = false;
		};
	};
}