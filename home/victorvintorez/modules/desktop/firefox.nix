{ config, pkgs, inputs, ... }: {
	imports = [
		inputs.arkenfox-nix.hmModules.arkenfox
	];

	programs.firefox = {
		enable = true;
		package = pkgs.firefox-wayland;

		arkenfox = {
			enable = true;
			version = "118.0";
		};

		profiles.Default = {
			bookmarks = {};
			extensions = with pkgs.nur.repos.rycee.firefox-addons; [
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
				"0800" = {
					enable = true;
					"0803"."browser.search.suggest.enabled" = {
						enable = false;
					};
					"0803"."browser.urlbar.suggest.searches" = {
						enable = false;
					};
				};
				"0900" = {
					enable = true;
				};
				"1200" = {
					enable = true;
				};
				"1600" = {
					enable = true;
				};
				"2400" = {
					enable = true;
				};
				"2600" = {
					enable = true;
				};
				"2700" = {
					enable = true;
				};
				"5000" = {
					enable = true;
					"5001"."browser.privatebrowsing.autostart" = {
						enable = false;
					};
					"5002"."browser.cache.memory.enable" = {
						enable = false;
					};
					"5002"."browser.cache.memory.capacity" = {
						"enable" = false;
					};
					"5005"."nocertdb" = {
						enable = false;
					};
					"5008"."sessionstore.resume_from_crash" = {
						enable = false;
					};
					"5010"."browser.urlbar.suggest.history" = {
						enable = false;
					};
					"5010"."browser.urlbar.suggest.openpage" = {
						enable = false;
					};
					"5012"."browser.urlbar.autoFill" = {
						enable = false;
					};
					"5013"."places.history.enabled" = {
						enable = false;
					};
					"5021"."keyword.enabled" = {
						enable = false;
					};
				};
				"6000" = {
					enable = true;
				};
				"9000" = {
					enable = true;
					"9004"."browser.urlbar.showSearchTerms.enabled" = {
						enabled = false;
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
