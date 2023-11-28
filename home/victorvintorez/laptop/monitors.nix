{ config, ... }: {
  monitors = [
    # Laptop Monitor
    {
      name = "eDP-1";
      primary = true;
      width = 3456;
      height = 2160;
      scale = 2;
      workspace = 1;
    }
    # Default
    {
      name = "";
      width = 1920;
      height = 1080;
      scale = 1;
      mirror = "eDP-1";
    }
  ];
}
