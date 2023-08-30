{ inputs, lib, config, pkgs, ... }: {
  # Modules
  imports = [
    # ./fish.nix
    ./git.nix
    ./github-cli.nix
    ./bitwarden-cli.nix
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
  };

  # Restart services
  systemd = {
    user = {
      startServices = "sd-switch";
    };
  };

  programs.home-manager.enable = true;
}
