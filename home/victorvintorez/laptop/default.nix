# TEST HOME MANAGER CONFIG
{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    ../modules/common.nix
    ./monitors.nix
    ../modules/desktop/university.nix
  ];

  # Add stuff for your user as you see fit:
  #programs.neovim.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
