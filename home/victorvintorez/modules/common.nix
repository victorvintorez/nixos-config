{ inputs, lib, config, pkgs, ... }: {
  # Modules
  imports = [
    ./cli
    ./desktop
    ./nixcolors.nix
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

  # Enable default xdg dirs
  xdg = {
    enable = true;
    cacheHome = "~/.cache";
    configHome = "~/.config";
    dataHome = "~/.local/share";
    stateHome = "~/.local/state";
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  # Restart services
  systemd = {
    user = {
      startServices = "sd-switch";
    };
  };

  programs.home-manager.enable = true;
}
