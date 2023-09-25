{ config, pkgs, inputs, ... }: {
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    configDir = ./config;
  };

  xdg.configFile."ags/css/style.css".text = ''
    ${pkgs.runCommand "style.css" {} "${pkgs.getBin pkgs.dart-sass} ${./config/scss/main.scss}"}
  '';
}