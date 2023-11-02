{ config, pkgs, ... }: {
  home.packages = with pkgs.jetbrains; [
    clion
    datagrip
    idea-ultimate
    pycharm-professional
    rider
    rust-rover
    webstorm
  ];

  home.sessionVariables = {
    _PATH_JAVA_AWT_WM_NONREPARENTING = "1";
  };
}