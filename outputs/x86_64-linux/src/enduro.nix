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

in {
  nixosConfigurations = {
    "${name}" = mylib.nixosSystem (base-modules // args);
  };
}
