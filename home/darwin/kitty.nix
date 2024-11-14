{lib, ...}: {
  programs.kitty.settings.hide_window_decorations = lib.mkForce "titlebar-only";
}
