{ inputs, lib, config, pkgs, ... }: {
  # Modules
  imports = [
    # ./fish.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  # Setup User
  home = {
    username = "victorvintorez";
    homeDirectory = lib.mkForce "/home/victorvintorez";
    isNormalUser = true;
    initialPassword = "defaultPassword";
    extraGroups = [
      "wheel"
      "plugdev"
      "networkmanager"
    ];
  };

  # Restart services
  systemd = {
    user = {
      startServices = "sd-switch";
    };
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;
}
