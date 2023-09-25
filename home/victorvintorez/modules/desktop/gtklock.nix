{ config, pkgs, lib, ... }: {
  home.packages = with pkgs; [
    gtklock
  ];

  xdg.configFile."gtklock/style.css".text = ''
    window {
      background: rgba(0, 0, 0, .95);
      font-family: 'Iosevka Nerd Font';
    }

    grid > label {
      color: transparent;
      margin: -15rem;
    }

    button {
      all: unset;
      color: transparent;
      margin: -15rem;
    }

    #clock-label {
      font-size: 6rem;
      margin-bottom: 4rem;
      text-shadow: 0px 2px 10px rgba(0, 0, 0, .1);
    }

    entry {
      border-radius: 8px;
      box-shadow: 0 1px 3px rgba(0, 0, 0, .1);
    }
  '';
}
