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
      allowUnfreePredicate = _: true;
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

  services = {
    gnome-keyring = {
      enable = true;
    };
  };

  programs = {
	home-manager = {
		enable = true;
	};
  };
}
