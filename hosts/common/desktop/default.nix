{ config, pkgs, inputs, lib, ... }: {
  imports = [
    ./pipewire.nix
    ./greeter
  ];

  environment = {
    variables = {
      NIXOS_OZONE_WL = "1";
      GDK_BACKEND = "wayland,x11";
      ANKI_WAYLAND = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      QT_STYLE_OVERRIDE = "kvantum";
      MOZ_ENABLE_WAYLAND = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      XDG_SESSION_TYPE = "wayland";
      SDL_VIDEODRIVER = "wayland";
      WLR_RENDERER_ALLOW_SOFTWARE = "1";
    };

  };

  xdg = {
    autostart = {
      enable = true;
    };
    icons = {
      enable = true;
    };
    menus = {
      enable = true;
    };
    mime = {
      enable = true;
    };
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
      ];
    };
  };

  sound = {
    enable = true;
    mediaKeys.enable = true;
  };

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.default;
      xwayland = {
        enable = true;
      };
    };
  	seahorse = {
		enable = true;
    };
  };

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
      tumbler
    ];
  };
}
