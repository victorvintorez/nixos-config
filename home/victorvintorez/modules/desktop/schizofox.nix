{ config, pkgs, inputs, ... }: {
	imports = [ inputs.schizofox.homeManagerModule ];

	programs.schizofox = {
		enable = true;
		search = {
			defaultSearchEngine = "DuckDuckGo";
		};
		security = {
			sanitizeOnShutdown = false;
			sandbox = false;
		};
		misc = {
			drmFix = true;
			disableWebgl = false;
		};
	};
}
