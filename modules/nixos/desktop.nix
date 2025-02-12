{
  pkgs,
  config,
  lib,
  myvars,
  ...
}:
{
  imports = [
    ./base
    ../base.nix

    ./desktop
  ];
}
