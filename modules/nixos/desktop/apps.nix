{
  pkgs,
  lib,
  ...
}: {

  environment.systemPackages = with pkgs; [
    firefox
    brightnessctl
  ];

}
