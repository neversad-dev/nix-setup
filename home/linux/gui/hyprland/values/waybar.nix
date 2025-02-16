{
  pkgs,
  pkgs-unstable,
  ...
}: {
  programs = {
    waybar.enable = true;
  };

  xdg.configFile = {
    "waybar" = {
      source = ../conf/waybar;
      recursive = true;
    };
  };
}

