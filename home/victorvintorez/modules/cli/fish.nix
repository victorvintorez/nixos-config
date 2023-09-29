{ config, pkgs, ... }: {
  programs.fish = {
    enable = true;
    functions = {
      fish_greeting = "";
    };
    shellInit = ''
      direnv hook fish | source
    '';
  };
}
