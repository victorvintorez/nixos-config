{ config, pkgs, inputs, ... }: {
	imports = [
		inputs.schizofox.homeManagerModules.default
	];

	programs.schizofox = {
		enable = true;

		theme = {
			background-darker = config.colorSchemes.colors.base01;
			background = config.colorSchemes.colors.base02;
			foreground = config.colorSchemes.colors.base05;
			font = "Iosevka Term";
			darkreader = {
				enable = true;
			};
		};

		search = {
			defaultSearchEngine = "DuckDuckGo";
			removeEngines = [ "Google" "Bing" "Amazon.com" "eBay" "Brave" "Twitter" ];
		};

		security = {
			sanitizeOnShutdown = false;
			sandbox = false;
		};

		extensions = {
			# Disable Default Extensions
			defaultExtensions = {};

			extraExtensions = {
				"uBlock0@raymondhill.net".install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
				"wappalyzer@crunchlabz.com".install_url = "https://addons.mozilla.org/firefox/downloads/latest/wappalyzer/latest.xpi";
				"tabcenter-reborn@ariasuni".install_url = "https://addons.mozilla.org/firefox/downloads/latest/tabcenter-reborn/latest.xpi";
				"@react-devtools".install_url = "https://addons.mozilla.org/firefox/downloads/latest/react-devtools/latest.xpi";
				"jid1-ZAdIEUB7XOzOJw@jetpack".install_url = "https://addons.mozilla.org/firefox/downloads/latest/duckduckgo-for-firefox/latest.xpi";
				"{74145f27-f039-47ce-a470-a662b129930a}".install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
				"{446900e4-71c2-419f-a6a7-df9c091e268b}".install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
				"{762f9885-5a13-4abd-9c77-433dcd38b8fd}".install_url = "https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislikes/latest.xpi";
				"languagetool-webextension@languagetool.org".install_url = "https://addons.mozilla.org/firefox/downloads/latest/languagetool/latest.xpi";
				"{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}".install_url = "https://addons.mozilla.org/firefox/downloads/latest/styl-us/latest.xpi";
			};
		};

		misc = {
			drmFix = true;
			disableWebgl = false;
			startPageURL = "https://duckduckgo.com";
		};
	};
}
