{ config, pkgs, inputs, lib, ... }: 
let
  #css = pkgs.runCommand "style.css" {} ''
  #  cp -r ./config $out
  #  ${pkgs.dart-sass}/bin/sass --load-path=./config/scss ./config/scss/main.scss $out/css/style.css
  #'';
in {
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    configDir = ./config;
  };

  #xdg.configFile.ags = {
  #  source = lib.mkForce css;
  #  recursive = true;
  #};
}