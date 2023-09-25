{ config, pkgs, lib, ... }: {
  home.packages = with pkgs; [
    gtklock
  ];

  security = {
    pam = {
      services = {
        gtklock = {
	  text = lib.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";
	};
      };
    };
  };

  xdg.configFile."gtklock/style.css".text = ''
    window {
      background: rgba(0, 0, 0, .5);
      font-family: 'Iosevka Nerd Font';
    }

    grid > label {
      color: transparent;
      margin: -20rem;
    }

    button {
      all: unset;
      color: transparent;
      margin -20rem;
    }

    #clock-label {
      font-size: 6rem;
      margin-bottom: 4rem;
      text-shadow: 0px 2px 10px rgba(0, 0, 0, .1);
    }

    entry {
      border-radius: 16px;
      margin: 6rem;
      box-shadow: 0 1px 3px rgba(0, 0, 0, .1);
    }
  '';
}
