{ config, pkgs, inputs, ... }: {
	imports = [ inputs.schizofox.homeManagerModule ];

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
}
