# BASE NIXOS CONFIG
{ config, pkgs, lib, inputs, outputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    #inputs.agenix.nixosModules.default
    ./fish.nix
    ./fonts.nix
    ./printing.nix
    ./users.nix
    ./desktop
  ];

  boot.kernelPackages = pkgs.linuxPackagesFor pkgs.linux_latest;

  # Enable nix-command and flakes
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
  };

  # Enable Sound
  sound = {
    enable = true;
  };
  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  # Bootloader
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
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

  # Minimal Default Packages
  environment.systemPackages = with pkgs; [
    wget
    git
    nixd
    insomnium
  ];

  # SSH Server
  services = {
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      settings.KbdInteractiveAuthentication = false;
    };
  };

  # Home-manager defaults
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
  };

  # agenix
}
