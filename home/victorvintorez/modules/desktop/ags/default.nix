{ config, pkgs, inputs, ... }: {
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    configDir = ./config;
  };

  xdg.configFile."ags/css/style.css".source = ''
    ${pkgs.runCommand "style.css" {} ''
      mkdir $out
      ${pkgs.dart-sass}/bin/sass --load-path=${./config/scss} ${./config/scss/main.scss}
    ''}
  '';
}