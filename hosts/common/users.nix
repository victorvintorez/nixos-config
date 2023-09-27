{ config, pkgs, ... }: {
  users = {
    users = {
      victorvintorez = {
        isNormalUser = true;
        initialPassword = "defaultPassword";
        shell = pkgs.fish;
        extraGroups = [
          "wheel"
          "video"
          "audio"
          "networkmanager"
          "seat"
        ];
      };
      murein = {
        isNormalUser = true;
        initialPassword = "defaultPassword";
        shell = pkgs.bash;
        extraGroups = [
          "video"
          "audio"
          "networkmanager"
          "seat"
        ];
      };
    };
  };
}
