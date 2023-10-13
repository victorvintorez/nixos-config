{ config, pkgs, ... }: {
	programs.vscode = {
		enable = true;
		package = pkgs.vscodium;
		userSettings = {
			"update.mode" = "none";
			"extensions.autoUpdate" = false;
			"window.menuBarVisibility" = "toggle";
			"editor.fontFamily" = "'Iosevka Nerd Font', 'monospace'";
			"workbench.colorTheme" = "Catppuccin Mocha";
			"workbench.iconTheme" = "vscode-icons";
			"vsicons.dontShowNewVersionMessage" = true;
			"editor.fontLigatures" = true;
			"window.zoomLevel" = 1;
			"nix.enableLanguageServer" = true;
			"nix.serverPath" = "nixd";
		};
		extensions = with pkgs.vscode-extensions; [
			jnoortheen.nix-ide
			catppuccin.catppuccin-vsc
			vscode-icons-team.vscode-icons
		];
	};
}
