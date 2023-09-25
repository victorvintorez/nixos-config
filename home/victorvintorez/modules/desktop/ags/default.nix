{ config, pkgs, inputs, ... }: {
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    configDir = ./config;
  };

  xdg.configFile."ags/css/style.css".text = pkgs.runCommand "style.css" {} "${pkgs.dart-sass}/bin/sass ${./config/scss/main.scss}";
}