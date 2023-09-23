{ config, pkgs, inputs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    enableNvidiaPatches = true;
    systemdIntegration = true;
    xwayland = {
	enable = true;
    };
	settings = {
		"$MOD" = "SUPER";
		bind = [
			"$MOD, Q, exec, ${pkgs.kitty}/bin/kitty"
			"$MOD, C, killactive"
			"$MOD, Space, exec, ${pkgs.rofi-wayland}/bin/rofi -show drun"
		];
	};
  };
}
