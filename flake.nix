{
  description = "Nix for macOS configuration";

  # the nixConfig here only affects the flake itself, not the system configuration!
  nixConfig = {
    substituters = [
      # Query the mirror of USTC first, and then the official cache.
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
  };

  inputs = {
    # Official NixOS package source, using nixos-unstable branch here
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    # nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.05-darwin";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    home-manager = {
      # url = "github:nix-community/home-manager";
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    # theme
    catppuccin.url = "github:catppuccin/nix";

    catppuccin-vsc.url = "https://flakehub.com/f/catppuccin/vscode/*.tar.gz";
    catppuccin-vsc.inputs.nixpkgs.follows = "nixpkgs";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    darwin,
    home-manager,
    nix-homebrew,
    ...
  }: let
    username = "tinker";
    useremail = "tinker@null.computer";

    aarch64_darwin = "aarch64-darwin";
    allSystems = [aarch64_darwin];

    hostname = "mbp";

    specialArgs =
      inputs
      // {
        inherit username useremail hostname;
      };
  in {
    # nix-darwin with home-manager for macOS
    darwinConfigurations."${hostname}" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      inherit specialArgs;

      modules = [
        ./hosts/mbp

        ./modules/darwin/nix-core.nix
        ./modules/darwin/system.nix
        ./modules/darwin/apps.nix
        ./modules/darwin/users.nix

        ({pkgs, ...}: {
          nixpkgs.overlays = [
            inputs.catppuccin-vsc.overlays.default
            inputs.nix-vscode-extensions.overlays.default
          ];

          # Other Nix-Darwin configuration...
        })

        # home manager
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.users.${username} = {...}:
            with inputs; {
              imports = [./home/darwin];
            };
        }

        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;
            user = "${username}";

            # Automatically migrate existing Homebrew installations
            autoMigrate = true;

            # Optional: Enable fully-declarative tap management
            #
            # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
            # mutableTaps = false;
          };
        }
      ];
    };

    # nix code formatter
    formatter = nixpkgs.lib.genAttrs allSystems (
      system: nixpkgs.legacyPackages.${system}.alejandra
    );
  };
}
