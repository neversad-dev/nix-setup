{
  # NOTE: the args not used in this file CAN NOT be removed!
  # because haumea pass argument lazily,
  # and these arguments are used in the functions like `mylib.nixosSystem`, `mylib.colmenaSystem`, etc.
  inputs,
  lib,
  mylib,
  myvars,
  system,
  genSpecialArgs,
  ...
} @ args: let
  name = "enduro";

  base-modules = {
    nixos-modules = map mylib.relativeToRoot [
      # common
      "modules/nixos/desktop.nix"
      # host specific
      "hosts/nixos-${name}"
    ];
    home-modules = map mylib.relativeToRoot [
      # common
      "home/linux/gui.nix"
      # host specific
      "hosts/nixos-${name}/home.nix"
    ];
  };

  modules-hyprland = {
    nixos-modules =
      [
        {
          modules.desktop.xorg.enable = false;
          modules.desktop.wayland.enable = true;
        }
      ]
      ++ base-modules.nixos-modules;
    home-modules =
    [
       {modules.desktop.hyprland.enable = true;}
    ]
    ++ base-modules.home-modules;
  };
in {
  nixosConfigurations = {
    "${name}" = mylib.nixosSystem (modules-hyprland // args);
  };
}
