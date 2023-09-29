{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    swww
  ];

  xdg.configFile."wallpapers".source = config.lib.file.mkOutOfStoreSymlink "${./wallpapers}";
}