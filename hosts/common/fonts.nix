{ config, pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      noto-fonts-emoji
      (nerdfonts.override { fonts = ["Iosevka" "JetBrainsMono"]; })
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [
          "Iosevka Term"
          "Iosevka Term Nerd Font Complete Mono"
          "Iosevka Nerd Font"
          "Noto Color Emoji"
        ];
        sansSerif = [ "Iosevka Nerd Font" "Noto Color Emoji" ];
        serif = [ "Iosevka Nerd Font" "Noto Color Emoji" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
