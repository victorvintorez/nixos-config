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
}