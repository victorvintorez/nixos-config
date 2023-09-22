{ config, pkgs, inputs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    enableNvidiaPatches = true;
    systemdIntegration = true;
	settings = {
		"$MOD" = "SUPER";
		bind = [
			"$MOD, Q, exec, kitty"
		];
	};
  };
}
