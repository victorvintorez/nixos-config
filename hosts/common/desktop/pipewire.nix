{ config, pkgs, ... }: {
  services = {
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
      };
      audio = {
        enable = true;
      };
      wireplumber.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
