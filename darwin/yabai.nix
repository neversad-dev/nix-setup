{...}: {
  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    config = {
      
      layout = "bsp"; # bsp, stack, float

      window_placement = "second_child";

      # padding
      top_padding = 10;
      bottom_padding = 10;
      left_padding = 10;
      right_padding = 10;
      window_gap = 10;

      # mouse settings  
      focus_follows_mouse = "autoraise"; # (default: off, options: off, autoraise, autofocus)
      mouse_follows_focus = "on";

      mouse_modifier = "ctrl";
      # left click + drag
      mouse_action1 = "move";
      # right click + drag
      mouse_action2 = "resize";

      mouse_drop_action = "swap"; # swap, stack

    };
    extraConfig = ''
      yabai -m rule --add app="^Finder$" manage=off
      yabai -m rule --add app="^Calculator$" manage=off
      yabai -m rule --add app="^Settings$" manage=off
      yabai -m rule --add app="^Bitwarden$" manage=off'';
  };
}
