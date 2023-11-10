{ config, ... }: {
  monitors = [
    {
      name = "eDP-1";
      primary = true;
      width = 3456;
      height = 2160;
      refreshRate = 60;
      x = 0;
      y = 0;
      scale = 2;
      workspace = "1";
    }
  ];
}
