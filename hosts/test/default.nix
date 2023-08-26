# TEST NIX CONFIG
{ config, pkgs, ... }: {
  imports = [
      ./hardware-configuration.nix
      ../common
    ];

  networking.hostName = "nixos"; # Define your hostname.

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.victorvintorez = {
    isNormalUser = true;
    description = "Victor Vintorez";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "victorvintorez";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  ];

  # Config State Version
  system.stateVersion = "23.05"; # Did you read the comment?
}
