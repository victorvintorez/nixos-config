{ config, pkgs, inputs, ... }: let 
  spicepkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in {
  imports = [ inputs.spicetify-nix.homeManagerModule ];

  programs.spicetify = {
    enable = true;
    theme = spicepkgs.themes.catppuccin;
    colorScheme = "sky";
    enabledExtensions = with spicepkgs.extensions; [
      shuffle
      powerBar
      skipStats
      wikify
    ];
  };
}