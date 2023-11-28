{ ... }: {
  monitors = [
    # Main Monitor
    {
      name = "DP-2";
      primary = true;
      width = 2560;
      height = 1440;
      refreshRate = 144;
      x = 1080;
      y = 440;
      vrr = 1;
      workspace = 1;
    }
    # Vertical Ultrawide
    {
      name = "DP-3";
      width = 2560;
      height = 1080;
      workspace = "vert";
    }
    # Default
    {
      name = "";
      width = 1920;
      height = 1080;
      scale = 1;
    }
  ];
}