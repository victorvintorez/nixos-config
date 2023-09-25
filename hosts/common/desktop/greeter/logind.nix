{ config, pkgs, ... }: {
  services = {
    logind = {
      lidSwitch = "suspend";
      lidSwitchExternalPower = "lock";
    };
  };
}