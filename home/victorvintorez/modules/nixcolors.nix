{ config, pkgs, inputs, ... }: let 
    oledppuccin = {
        slug = "oledppuccin";
        name = "Oledppuccin";
        author = "Victor Vintorez (Based on Catppuccin -> https://github.com/catppuccin)";
        colors = {
            base00 = "000000"; # Pure Black
            base01 = "1E1E2E"; # Base
            base02 = "181825"; # Mantle
            base03 = "313244"; # Surface0
            base04 = "45475A"; # Surface1
            base05 = "CDD6F4"; # Text
            base06 = "F5E0DC"; # Rosewater
            base07 = "B4bEFE"; # Lavender
            base08 = "F38BA8"; # Red
            base09 = "FAB387"; # Peach
            base0A = "F9E2AF"; # Yellow
            base0B = "A6E3A1"; # Green
            base0C = "94E2D5"; # Teal
            base0D = "89B4FA"; # Blue
            base0E = "CBA6F7"; # Mauve
            base0F = "F2CDCD"; # Flamingo
        };
    };
in {
    imports = [ inputs.nix-colors.homeManagerModules.default ];

    colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
}