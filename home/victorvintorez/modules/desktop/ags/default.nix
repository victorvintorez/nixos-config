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

  xdg.configFile."ags/css/colors.css".text = ''
    :root {
      --base00: #000000;
      --base01: #1E1E2E;
      --base02: #181825;
      --base03: #313244;
      --base04: #45475A;
      --base05: #CDD6F4;
      --base06: #F5E0DC;
      --base07: #B4bEFE;
      --base08: #F38BA8;
      --base09: #FAB387;
      --base0A: #F9E2AF;
      --base0B: #A6E3A1;
      --base0C: #94E2D5;
      --base0D: #89B4FA;
      --base0E: #CBA6F7;
      --base0F: #F2CDCD;
    }
  '';

  #xdg.configFile.ags = {
  #  source = lib.mkForce css;
  #  recursive = true;
  #};
}