{ config, pkgs, ... }: {
  imports = [
    ./logind.nix
  ];
  
  services = {
    greetd = {
      enable = true;
      restart = true;
      settings = rec {
        initial_session = {
          user = "victorvintorez";
          command = "Hyprland";
        };
        default_session = initial_session;
      };
    };
  };
}
