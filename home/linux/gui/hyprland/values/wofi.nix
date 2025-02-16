{
  pkgs,
  pkgs-unstable,
  ...
}: {
  programs = {
    wofi = {
      enable = true;
    };
  };

  xdg.configFile = {
    "wofi" = {
      source = ../conf/wofi;
      recursive = true;
    };
  };
}

