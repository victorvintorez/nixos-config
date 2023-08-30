{ config, pkgs, ... }: {
  programs.git = {
    enable = true;
    userEmail = "victorvintorez@proton.me";
    userName = "victorvintorez";
  };
}
