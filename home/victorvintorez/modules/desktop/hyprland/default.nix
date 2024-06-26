{ config, pkgs, inputs, lib, ... }: let
  monitorsList = map (
    m: let
      resolution = ", ${toString m.width}x${toString m.height}@${toString m.refreshRate}";
      position = ", ${toString m.x}x${toString m.y}";
	  scale = if m.scale != null then ", ${toString m.scale}" else "";
	  transform = if m.transform != null then ", transform, ${toString m.transform}" else "";
	  mirror = if m.mirror != null then ", mirror, ${m.mirror}" else "";
	  vrr = if m.vrr != null then ", vrr, ${m.vrr}" else "";
    in "${m.name}${
      if m.enabled
      then "${resolution}${position}${scale}${transform}${mirror}${vrr}"
      else ", disable"
    }"
  ) (config.monitors);

  workspaceList = map (
    m: "${
      if builtins.isInt m.workspace
      then "${toString m.workspace}, monitor:${m.name}, default:true, persistent:true"
      else if builtins.isStr
      then "name:${m.workspace}, monitor:${m.name}, default:true, persistent:true"
      else ""
    }"
  ) (lib.filter (m: m.enabled && m.workspace != null) config.monitors);
in {
	imports = [
    ./env.nix
    ./keybinds.nix
    ./startup.nix
    ./windowrules.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    systemd = {
      enable = true;
    };
    xwayland = {
      enable = true;
    };
    plugins = [
      inputs.hyprgrass.packages.${pkgs.system}.default
    ];
    settings = {
      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        "col.active_border" = "rgb(${config.colorScheme.palette.base0C}) rgb(${config.colorScheme.palette.base0D}) 45deg";
        "col.inactive_border" = "rgb(${config.colorScheme.palette.base04})";
        no_border_on_floating = false;
        no_cursor_warps = true;
        resize_on_border = true;

        layout = "dwindle";
      };
      input = {
        kb_layout = "us";
        numlock_by_default = true;

        follow_mouse = 2;
        float_switch_override_focus = 1;

        touchpad = {
          natural_scroll = false;
          middle_button_emulation = true;
          drag_lock = true;
        };

        sensitivity = 0;
      };
      decoration = {
        rounding = 5;

        active_opacity = 0.98;
        inactive_opacity = 0.92;
        fullscreen_opacity = 1.0;

        drop_shadow = false;

        blur = {
          enabled = true;
          size = 10;
          xray = true;
        };
      };
      animations = {
        enabled = true;
        bezier = [
          "smoothOut, 0.36, 0, 0.66, -0.56"
          "smoothIn, 0.25, 1, 0.5, 1"
          "overshot, 0.4, 0.8, 0.2, 1.2"
        ];
        animation = [
          "windows, 1, 4, overshot, slide"
          "windowsOut, 1, 4, smoothOut, slide"
          "border, 1, 10, default"

          "fade, 1, 10, smoothIn"
          "fadeDim, 1, 10, smoothIn"
          "workspaces, 1, 4, overshot, slidevert"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_distance = 300;
        workspace_swipe_invert = false;
      };
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      # Monitor Mapping
      monitor = monitorsList;
      workspace = workspaceList;
    };
  };
}
