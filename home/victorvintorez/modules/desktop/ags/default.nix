{ config, pkgs, inputs, lib, ... }: {
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    configDir = config.lib.file.mkOutOfStoreSymlink "${./config}";
  };

  home.packages = with pkgs; [
    dart-sass
    pulseaudio
  ];
}