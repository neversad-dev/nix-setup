{myvars, ...}: {
  home.homeDirectory = "/Users/${myvars.username}";

  imports = [
    ../base/core
    ../base/gui
    ../base/tui
    ../base/home.nix
  ];
}
