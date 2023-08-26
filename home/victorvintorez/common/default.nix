{ inputs, lib, config, pkgs, ... }: {
  # Modules
  imports = [
    # ../common/fish.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  # Setup User
  home = {
    username = "victorvintorez";
    homeDirectory = "/home/victorvintorez";
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
