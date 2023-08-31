{ config, pkgs, ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      format =
        let
          git = "$git_branch$git_commit$git_state$git_status";
        in
        ''
          $username$hostname($shlvl)
          $directory(${git}) $fill $time
          $jobs$character
        '';

      fill = {
        symbol = " ";
        disabled = false;
      };

      username = {
        format = "[$user]($style)";
        show_always = true;
      };

      hostname = {
        format = "[@$hostname]($style) ";
        ssh_only = false;
        style = "bold green";
      };

      shlvl = {
        format = "[$shlvl]($style)";
        style = "bold cyan";
        threshold = 2;
        repeat = true;
        disabled = false;
      };

      directory = {
        format = "[$path]($style)( [$read_only]($read_only_style)) ";
      };

      time = {
        format = "\\\[[$time]($style)\\\]";
        disabled = false;
      };

      character = {
        error_symbol = "[~~>](bold red)";
        success_symbol = "[->>](bold green)";
      };
    };
  };
}
