{ config, pkgs, ... }: {
  services = {
    xserver = {
      videoDrivers = ["nvidia"];
    };
  };

  hardware = {
    nvidia = {
      modesetting = {
        enable = true;
      };
      powerManagement = {
        enable = true;
      };
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  programs = {
    hyprland = {
      enableNvidiaPatches = true;
    };
  };
}
