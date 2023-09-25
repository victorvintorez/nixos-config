{ config, pkgs, inputs, ... }: 
let
  css = pkgs.runCommand "style.css" {} ''
    cp -r ${./config} $out
    ${pkgs.dart-sass}/bin/sass --load-path=${./config/scss} ${./config/scss/main.scss} $out/css/style.css
  '';
in {
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
  };

  xdg.configFile.ags = {
    source = css;
    recursive = true;
  };
}