{ config, pkgs, inputs, ... }: {
	imports = [ inputs.nixvim.homeManagerModules.nixvim ];

	programs.nixvim = {
		enable = true;
		colorscheme = "catppuccin";
	};
}
