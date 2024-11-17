{...}: {
  programs.kitty = {
    enable = true;

    settings = {
      font_family = "FiraCode Nerd Font Mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      font_size = "14.0";

      hide_window_decorations = "yes";
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      window_padding_width = 0;
      background_opacity = "0.8";
      background_blur = 50;
      cursor_shape = "underline"; # block, beam, underline
      disable_ligatures = "never";
      tab_bar_style = "powerline"; # fade, slant, separator, powerline, custom, hidden
      tab_powerline_style = "round"; # angled, slanted, round
      tab_activity_symbol = " ";
    };
  };
}
