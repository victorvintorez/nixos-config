{ config, pkgs, ... }: {
  imports = [
    ./gtk
    ./qt
  ];

  home = {
    pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
      gtk = {
        enable = true;
      };
      x11 = {
        enable = true;
      };
    };
    sessionVariables = {
      XCURSOR_SIZE = "16";
    };
  };
}