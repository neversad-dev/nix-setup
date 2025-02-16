{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    networkmanagerapplet # GUI for network manager: nm-applet, nm-connection-editor
    swaykbdd    # for keyboard layout reporting to waybar
  ];
}
