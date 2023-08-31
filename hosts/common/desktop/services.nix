{ config, pkgs, ... }: {
  systemd.services = {
    seatd = {
      enable = true;
      description = "Seat Management Daemon";
      script = "${pkgs.seatd}/bin/seatd -g wheel";
      serviceConfig = {
        Type = "simple";
        Restart = "always";
        RestartSec = "1";
      };
      wantedBy = ["multi-user.target"];
    };
  };

  services = {
    greetd = {
      enable = true;
      settings = {
        initial_session = rec {
          command = "Hyprland";
          user = "victorvintorez";
        };
        default_session = initial_session;
      };
    };
  };
}
