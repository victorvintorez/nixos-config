{ config, pkgs, inputs, ... }: {
	imports = [ 
		inputs.schizofox.homeManagerModule
		inputs.arkenfox-nixos.hmModules.arkenfox
	];

	programs.schizofox = {
		enable = true;
		theme = {
			background-darker = config.colorScheme.colors.base00;
			background = config.colorScheme.colors.base01;
			foreground = config.colorScheme.colors.base05;
			font = "Iosevka Nerd Font";
			darkreader.enable = true;
		};
		search = {
			defaultSearchEngine = "DuckDuckGo";
			removeEngines = [
				"Google"
				"Bing"
				"Amazon.com"
				"eBay"
				"Twitter"
				"Wikipedia"
			];
		};
		security = {
			sanitizeOnShutdown = false;
			sandbox = false;
		};
		misc = {
			drmFix = true;
			disableWebgl = false;
		};
		extensions.extraExtensions = {
			"bitwarden".install_url = "https://addons.mozilla.org/firefox/downloads/file/4164440/bitwarden_password_manager-2023.8.3.xpi";
			"languagetool".install_url = "https://addons.mozilla.org/firefox/downloads/file/4128570/languagetool-7.1.13.xpi";
			"wappalyzer".install_url = "https://addons.mozilla.org/firefox/downloads/file/4150627/wappalyzer-6.10.65.xpi";
		};
	};

	programs.firefox = {
		enable = true;

		arkenfox = {
			enable = true;
			version = "103.0";
		};

		profiles.Default = {
			bookmarks = {};
			extensions = with pkgs.inputs.firefox-addons; [
				bitwarden
				ublock-origin
				languagetool
				wappalyzer
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
				"9000" = {
					enable = true;
					"9004"."browser.urlbar.showSearchTerms.enabled" = {
						enable = false;
					};
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
