{ config, pkgs, inputs, ... }: {
	imports = [ inputs.nixvim.homeManagerModules.nixvim ];

	programs.nixvim = {
		enable = true;
		colorscheme = "catppuccin";

		# Colorscheme
		colorschemes = {
			catppuccin = {
				enable = true;
				flavour = "mocha";
			};
		};
	};
}
