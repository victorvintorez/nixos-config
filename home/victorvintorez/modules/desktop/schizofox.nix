{ config, pkgs, inputs, ... }: {
	imports = [ 
		inputs.arkenfox-nixos.hmModules.arkenfox
	];

	programs.firefox = {
		enable = true;
		package = pkgs.firefox-wayland;

		arkenfox = {
			enable = true;
			version = "103.0";
		};

		profiles.Default = {
			bookmarks = {};
			extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
				bitwarden
				ublock-origin
				#languagetool
				#wappalyzer
			];
			arkenfox = {
				enable = true;
				"0000".enable = true;
				"0100" = {
					enable = true;
					"0102"."browser.startup.page" = {
						enable = true;
						value = 3;
					};
				};
				"0200" = {
					enable = true;
				};
				"0300" = {
					enable = true;
				};
				"0400" = {
					enable = true;
				};
				"0900" = {
					enable = true;
				};
				"1200" = {
					enable = true;
				};
				"2600" = {
					enable = true;
				};
				"2700" = {
					enable = true;
				};
				"6000" = {
					enable = true;
				};
			};
		};
	};

	xdg.mimeApps.defaultApplications = {
    "text/html" = [ "firefox.desktop" ];
    "text/xml" = [ "firefox.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
  };
}
