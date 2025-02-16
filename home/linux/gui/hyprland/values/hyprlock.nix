{
  config,
  pkgs,
  ...
}: {
  programs = {
    hyprlock = {
      enable = true;
   };
  };

  xdg.configFile = {
    "hypr/hyprlock.conf" = {
      source = ../conf/hyprlock.conf;
    };
  };
}

