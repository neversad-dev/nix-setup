{
  pkgs,
  pkgs-unstable,
  ...
}: {
  services = {
    swaync = {
      enable = true;
      settings = {};
      style = ''

      '';
    };
  };
}

