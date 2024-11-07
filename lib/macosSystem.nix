{
  lib,
  inputs,
  darwin-modules,
  home-modules ? [],
  myvars,
  system,
  genSpecialArgs,
  specialArgs ? (genSpecialArgs system),
  ...
}: let
  inherit (inputs) nixpkgs-darwin home-manager nix-darwin nix-homebrew homebrew-core homebrew-cask;
in
  nix-darwin.lib.darwinSystem {
    inherit system specialArgs;
    modules =
      darwin-modules
      ++ [
        ({lib, ...}: {
          nixpkgs.pkgs = import nixpkgs-darwin {
            inherit system;
            config.allowUnfree = true;
          };
        })
      ]
      ++ (
        lib.optionals ((lib.lists.length home-modules) > 0)
        [
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "home-manager.backup";

            home-manager.extraSpecialArgs = specialArgs;
            home-manager.users."${myvars.username}".imports = home-modules;
          }
        ]
      )
      ++ [
        (nix-homebrew.darwinModules.nix-homebrew {
          lib = lib;
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = myvars.username;
            taps = {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
            };
            mutableTaps = false;
            autoMigrate = true;
          };
        })
      ];
  }
