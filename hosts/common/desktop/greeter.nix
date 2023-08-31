{ config, pkgs, ... }: {
  services = {
    greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "Hyprland";
          user = "victorvintorez";
        };
        default_session = initial_session;
      };
    };
  };
}
