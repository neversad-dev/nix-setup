{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  home.packages = with pkgs; [
    firefox

    telegram-desktop
    signal-desktop
    viber
    zoom-us

    localsend
    bitwarden-desktop

    obs-studio
    onlyoffice-desktopeditors
    obsidian

    android-studio
    orca-slicer

  ];

}
