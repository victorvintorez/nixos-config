{ config, pkgs, ... }: {
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
    logind = {
      lidSwitch = "suspend";
      lidSwitchExternalPower = "lock";
    };
  };
}
