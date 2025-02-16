{
  config,
  pkgs,
  ...
}: let
  wallpaperDir = "${config.xdg.userDirs.pictures}/Wallpapers";

in {
  services = {
    hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
	splash = false;
	splash_offset = 2.0;

	preload = [
          "${wallpaperDir}/dominik-mayer-3.jpg"
	];

	wallpaper = [
          ",${wallpaperDir}/dominik-mayer-3.jpg"
	];
      };
    };
  };

  home.file."${wallpaperDir}" = {
    source = ../wallpapers;
    recursive = true;
  };
}

