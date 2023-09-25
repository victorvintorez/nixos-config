{ config, pkgs, ... }: {
  imports = [
    ./logind.nix
    ./gtklock.nix
  ];
  
  programs = {
    regreet = {
      enable = true;
      settings = {
        background = {
          path = ./background.png;
          fit = "Fill";
        };
        gtk = {
          application_prefer_dark_theme = true;
          cursor_theme_name = "Bibata-Modern-Classic";
          font_name = "Iosevka Nerd Font 16";
          icon_theme_name = "Papirus";
          theme_name = "Catppuccin-Mocha-Compact-Sky-dark";
        };
      };
    };
  };
}
