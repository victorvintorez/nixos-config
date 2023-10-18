{ config, pkgs, ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      format =
        let
          git = "[](fg:#${config.colorScheme.colors.base07} bg:#FCA17D)$git_branch$git_commit$git_state$git_status[](fg:#FCA17D bg:#FCA17D)";
        in
        ''
          [](#${config.colorScheme.colors.base06})$username$hostname[](bg:#${config.colorScheme.colors.base07} fg:#${config.colorScheme.colors.base06})$directory(${git}) $fill $time
          [](fg:#86BBD8 bg:#06969A)$direnv[](fg:#06969A bg:#33658A)$bun$c$dart$deno$dotnet$golang$gradle$java$kotlin$lua$nodejs$python$r$rust$zig[ ](fg:#33658A)$sudo$character
        '';

      fill = {
        symbol = " ";
        disabled = false;
      };

      git_branch = {
        style = "fg:#FCA17D bg:#FCA17D";
      };

      username = {
        format = "[$user]($style)";
        style_user = "fg:#${config.colorScheme.colors.base00} bg:#${config.colorScheme.colors.base06}";
        show_always = true;
      };

      hostname = {
        format = "[@$hostname ]($style)";
        ssh_only = false;
        style = "fg:#${config.colorScheme.colors.base00} bg:#${config.colorScheme.colors.base06}";
      };

      directory = {
        format = "[$path]($style)( [$read_only]($read_only_style)) ";
        style = "fg:#${config.colorScheme.colors.base00} bg:#${config.colorScheme.colors.base07}";
        read_only_style = "fg:red bg:#${config.colorScheme.colors.base07}";
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
