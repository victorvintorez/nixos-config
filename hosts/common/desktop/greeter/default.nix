{ config, pkgs, ... }: {
  programs = {
    regreet = {
      enable = true;
      settings = {
        background = {
          path = ./background.png;
          fit = "Fill"
        };
      };
    };
  };
}
