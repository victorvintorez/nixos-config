{ config, pkgs, ... }: {
  home = {
    packages = with pkgs; [
      libsForQt5.qtstyleplugin-kvantum
      (catppuccin-kvantum.override {
        accent = "Sky";
        variant = "Mocha";
      })
    ];
    sessionVariables = {
      QT_STYLE_OVERRIDE = "kvantum";
    };
  };
  xdg.configFile."Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini {}).generate "kvantum.kvconfig" {
    General.Theme = "Catppuccin-Mocha-Mauve";
    Applications.catppuccin = "qt5ct";
  };
}