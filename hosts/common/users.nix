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
        ];
      };
    };
  };
}
