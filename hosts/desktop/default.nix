# TEST NIX CONFIG
{ config, pkgs, lib, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../common
  ];

  networking.hostName = "desktop"; # Define your hostname.

  # Configure keymap in X11
  services = {
    xserver = {
      layout = "us";
      xkbVariant = "";
    };
    videoDrivers = [ "nvidia" ];
  };

  environment.variables = {
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  security = {
    pam = {
      services = {
        gtklock = {
	        text = lib.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";
	      };
      };
    };
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    nvidia = {
      open = true;
      nvidiaSettings = true;
      powerManagement = {
        enable = true;
        finegrained = false;
      };
      modesetting = {
        enable = true;
      };
    };
    opengl.extraPackages = with pkgs; [ nvidia-vaapi-driver ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vulkan-loader
    vulkan-validation-layers
    vulkan-tools
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  ];

  # Home-Manager config file
  home-manager = {
    users = {
      victorvintorez = import ../../home/victorvintorez/desktop;
    };
  };

  # Config State Version
  system.stateVersion = "23.05"; # Did you read the comment?
}
