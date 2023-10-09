{ config, pkgs, ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      format =
        let
          git = "[](fg:#DA627D bg:#FCA17D)$git_branch$git_commit$git_state$git_status";
        in
        ''
          [](#9A348E)$username$hostname[](bg:#DA627D fg:#9A348E)$directory(${git}) $fill $time
          [](fg:#86BBD8 bg:#06969A)$direnv[](fg:#06969A bg:#33658A)$bun$c$dart$deno$dotnet$golang$gradle$java$kotlin$lua$nodejs$python$r$rust$zig[ ](fg:#33658A)$sudo$character
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

      directory = {
        format = "[$path]($style)( [$read_only]($read_only_style)) ";
      };

      time = {
        format = "\\\[[$time]($style)\\\]";
        disabled = false;
      };

      sudo = {
        disabled = false;
        format = "[$symbol]($style)";
        symbol = "󱑷 ";
        style = "red";
      };

      character = {
        error_symbol = "[~~>](bold red)";
        success_symbol = "[->>](bold green)";
      };

      custom = {
        direnv = {
            command = ''[[ $(direnv status) =~ "Found RC allowed false" ]] && echo "=========> missing: direnv allow <============"'';
            detect_files = [ ".envrc" ];
            format = "[$symbol($output)]($style)";
            symbol = "󱄅 ";
            style = "bold blue";
        };
      };
    };
  };
}
