{ config, pkgs, lib, ... }: {
  home.packages = with pkgs; [
    gtklock
  ];

  xdg.configFile."gtklock/style.css".text = ''
    window {
      background: url(https://cdn.discordapp.com/attachments/1145401204432719884/1145401205019901962/nixppuccin.png?ex=6517017f&is=6515afff&hm=a8bb76f30eb23c1d4a544360b1318d37773354da4c352fa8a91d5b43ea36655c&);
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
