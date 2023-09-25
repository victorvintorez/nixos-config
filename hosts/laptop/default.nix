# TEST NIX CONFIG
{ config, pkgs, ... }: {
  imports = [
      ./hardware-configuration.nix
      ../common
    ];

  networking.hostName = "laptop"; # Define your hostname.

  # Configure keymap in X11
  services = {
    xserver = {
      layout = "us";
      xkbVariant = "";
    };
    fprintd = {
      enable = true;
    };
  };

  security = {
    pam = {
      services = {
        login = {
          fprintAuth = true;
        };
        sudo = {
          fprintAuth = true;
        };
      };
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  ];

  # Home-Manager config file
  home-manager = {
    users = {
      victorvintorez = import ../../home/victorvintorez/laptop;
    };
  };

  # Config State Version
  system.stateVersion = "23.05"; # Did you read the comment?
}
