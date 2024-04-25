{ config, pkgs, ... }: {
  home.packages = with pkgs.jetbrains; [
    clion
    datagrip
    idea-ultimate
    pycharm-professional
    rider
    rust-rover
    webstorm
    github-copilot-intellij-agent # ln -fs /run/current-system/sw/bin/copilot-agent ~/.local/share/JetBrains/IntelliJIdea2022.2/github-copilot-intellij/copilot-agent/bin/copilot-agent-linux
  ];

  home.sessionVariables = {
    _PATH_JAVA_AWT_WM_NONREPARENTING = "1";
  };
}