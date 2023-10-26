{ config, pkgs, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Sky-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "sky" ];
        tweaks = [ "rimless" "black" ];
        size = "compact";
        variant = "mocha";
      };
    };
    iconTheme = {
      package = pkgs.catppuccin-papirus-folders;
      name = "Papirus";
    };
    font = {
      name = "Iosevka Nerd Font";
      size = 14;
    };
  };
}