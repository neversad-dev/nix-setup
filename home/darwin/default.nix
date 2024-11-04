{username, ...}: {
  home.homeDirectory = "/Users/${username}";

  imports = [
    ../base/core
    ../base/gui
    ../base/tui
    ../base/home.nix
  ];
}
