{ config, pkgs, inputs, lib, ... }: {
  xdg.configFile."ags".source = ./config;

  xdg.configFile."colors/colors.scss".text = ''
  $base00: #${config.colorScheme.palette.base00};
  $base01: #${config.colorScheme.palette.base01};
  $base02: #${config.colorScheme.palette.base02};
  $base03: #${config.colorScheme.palette.base03};
  $base04: #${config.colorScheme.palette.base04};
  $base05: #${config.colorScheme.palette.base05};
  $base06: #${config.colorScheme.palette.base06};
  $base07: #${config.colorScheme.palette.base07};
  $base08: #${config.colorScheme.palette.base08};
  $base09: #${config.colorScheme.palette.base09};
  $base0A: #${config.colorScheme.palette.base0A};
  $base0B: #${config.colorScheme.palette.base0B};
  $base0C: #${config.colorScheme.palette.base0C};
  $base0D: #${config.colorScheme.palette.base0D};
  $base0E: #${config.colorScheme.palette.base0E};
  $base0F: #${config.colorScheme.palette.base0F};
  '';

  home.packages = with pkgs; [
    inputs.ags.packages.${pkgs.system}.default
    dart-sass
    pulseaudio
    pavucontrol
    gnome.gnome-bluetooth
    libdbusmenu-gtk3
  ];
}