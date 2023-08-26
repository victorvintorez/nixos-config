# BASE NIXOS CONFIG
{ config, pkgs, lib, inputs, outputs, ... }: {
  imports = [
    ./fish.nix
  ]

  # Enable nix-command and flakes
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };

  # Bootloader
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
  };

  # Enable Networking with networkmanager
  networking = {
    networkmanager = {
      enable = true;
    };
  };

  # Set Timezone
  time = {
    timeZone = "Europe/London";
  };

  # Internationalization - US with GB extra settings (date, money, etc)
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_GB.UTF-8";
      LC_IDENTIFICATION = "en_GB.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "en_GB.UTF-8";
      LC_NAME = "en_GB.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_TELEPHONE = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
  };

  # Allow unfree packages
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  # Minimal Default Packages
  environment.systemPackages = with pkgs; [
    wget
    git
  ];
}