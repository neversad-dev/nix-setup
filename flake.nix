#
#  flake.nix *
#   ├─ ./hosts
#   │   └─ default.nix
#   ├─ ./darwin
#   │   └─ default.nix
#   └─ ./nix
#       └─ default.nix
#

{
	description = "Nix and Nix Darwin System Flake Configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; # Nix Packages (Default)
		# nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable"; # Unstable Nix Packages
		nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05"; # Unstable Nix Packages

		# User Environment Manager
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# Stable User Environment Manager
		home-manager-stable = {
			url = "github:nix-community/home-manager/release-23.11";
			inputs.nixpkgs.follows = "nixpkgs-stable";
		};

		# MacOS Package Management
		darwin = {
			url = "github:lnl7/nix-darwin/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
	};

	outputs = inputs@{ self, nixpkgs, nixpkgs-stable, home-manager, home-manager-stable, darwin, nix-homebrew}:
	let
		# Variables Used In Flake
		vars = {
			user = "tinker";
			location = "$HOME/.setup";
			terminal = "kitty";
			editor = "nvim";
		};
  in
  {
	darwinConfigurations = (
		import ./darwin {
		inherit (nixpkgs) lib;
		inherit inputs nixpkgs nixpkgs-stable home-manager darwin vars;  # nixvim
		}
	);
  };
}
