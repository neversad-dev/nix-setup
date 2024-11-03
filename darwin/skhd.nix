{...}: {
  services.skhd = {
    enable = true;
    skhdConfig = ''
      # switch - ctrl
      # move - cmd + ctrl
      # resize - cmd + ctrl +shift
      # specias commands - cmd + alt

      # windows - j, k, h, l
      # wor2kspaces - p, n, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0
      # displays - s, g


      # change window focus within space
      ctrl - j : yabai -m window --focus south
      ctrl - k : yabai -m window --focus north
      ctrl - h : yabai -m window --focus west
      ctrl - l : yabai -m window --focus east

      #change focus between external displays (left and right)
      ctrl - s: yabai -m display --focus west
      ctrl - g: yabai -m display --focus east

      # move window
      cmd + ctrl - j : yabai -m window --warp south
      cmd + ctrl - k : yabai -m window --warp north
      cmd + ctrl - h : yabai -m window --warp west
      cmd + ctrl - l : yabai -m window --warp east

      # move window to display left and right
      cmd + ctrl - s : yabai -m window --display west; yabai -m display --focus west
      cmd + ctrl - g : yabai -m window --display east; yabai -m display --focus east

      # move window to prev and next space
      ctrl - m : yabai -m space --focus last
      cmd + ctrl - m : yabai -m window --space last
      cmd + ctrl - p : yabai -m window --space prev
      cmd + ctrl - n : yabai -m window --space next

      # move window to space
      cmd + ctrl - 1 : yabai -m window --space 1
      cmd + ctrl - 2 : yabai -m window --space 2
      cmd + ctrl - 3 : yabai -m window --space 3
      cmd + ctrl - 4 : yabai -m window --space 4
      cmd + ctrl - 5 : yabai -m window --space 5
      cmd + ctrl - 6 : yabai -m window --space 6
      cmd + ctrl - 7 : yabai -m window --space 7
      cmd + ctrl - 8 : yabai -m window --space 8
      cmd + ctrl - 9 : yabai -m window --space 9
      cmd + ctrl - 0 : yabai -m window --space 10

      # Resize windows
      shift + cmd + ctrl - h : yabai -m window --resize left:-50:0; \
                        yabai -m window --resize right:-50:0
      shift + cmd + ctrl - j : yabai -m window --resize bottom:0:50; \
                        yabai -m window --resize top:0:50
      shift + cmd + ctrl - k : yabai -m window --resize top:0:-50; \
                        yabai -m window --resize bottom:0:-50
      shift + cmd + ctrl - l : yabai -m window --resize right:50:0; \
                        yabai -m window --resize left:50:0


      # rotate layout clockwise
      cmd + ctrl - r : yabai -m space --rotate 270

      # flip along y-axis
      cmd + ctrl - y : yabai -m space --mirror y-axis

      # flip along x-axis
      cmd + ctrl - x : yabai -m space --mirror x-axis

      # toggle window float
      cmd + ctrl - t : yabai -m window --toggle float --grid 4:4:1:1:2:2

      # maximize a window
      cmd + ctrl - m : yabai -m window --toggle zoom-fullscreen

      # balance out tree of windows (resize to occupy same area)
      cmd + ctrl - e : yabai -m space --balance

      # stop/start/restart yabai
      cmd + alt - q : yabai --stop-service
      cmd + alt - s : yabai --start-service
      cmd + alt - r : yabai --restart-service

    '';
  };
}
