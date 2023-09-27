# TEST HOME MANAGER CONFIG
{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    #./monitors.nix
  ];

    nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  # Setup User
  home = {
    username = "murein";
    homeDirectory = lib.mkForce "/home/murein";
  };

  # Restart services
  systemd = {
    user = {
      startServices = "sd-switch";
    };
  };

  programs.home-manager.enable = true;

  # Add stuff for your user as you see fit:
  programs.neovim.enable = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
