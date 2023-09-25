{ config, pkgs, ... }: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 1;
        follow = "none";

        # Geometry
        width = 500;
        height = 300;
        origin = "top-right";
        offset = "10x50";
        scale = 0;
        notification_limit = 10;

        # Progress Bar
        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        progress_bar_corner_radius = 2;

        # Decoration and Spacing
        icon_corner_radius = 0;
        indicate_hidden = true;
        transparency = 0;
        separator_height = 8;
        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 0;
        frame_width = 3;
        frame_color = "#${config.colorScheme.colors.base0D}";
        gap_size = 4;
        seperator_color = "frame";
        sort = true;

        # Text Options
        font = "Iosevka Nerd Font";
        line_height = 0;
        markup = "full";
        format = "<b>%a:\n%s</b>\n%b\n%p";
        alignment = "left";
        vertical_alignment = "center";

        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = false;
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = true;

        # Icons
        enable_recursive_icon_lookup = true;
        icon_theme = "Adwaita";
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 128;

        # History
        sticky_history = true;
        history_length = 20;

        # Misc
        dmenu = "${pkgs.rofi}/bin/rofi -dmenu -p dunst";
        browser = "${pkgs.xdg-utils}/bin/xdg-open";
        always_run_script = true;
        title = "Dunst";
        class = "dunst";
        corner_radius = 5;
        ignore_dbusclose = false;

        # Mouse Actions
        mouse_left_click = "do_action, close_current";
        mouse_middle_click = "close_all";
        mouse_right_click = "close_current";
      };
      urgency_low = {
        background = "#${config.colorScheme.colors.base01}";
        foreground = "#${config.colorScheme.colors.base05}";
      };
      urgency_normal = {
        background = "#${config.colorScheme.colors.base01}";
        foreground = "#${config.colorScheme.colors.base05}";
      };
      urgency_critical = {
        background = "#${config.colorScheme.colors.base01}";
        foreground = "#${config.colorScheme.colors.base05}";
        frame_color = "#${config.colorScheme.colors.base08}";
      };
    };
  };
}