# Nix darwin config


## Prerequisites
Log in to App Store for installing apps from it.

Install nix:
```
sh <(curl -L https://nixos.org/nix/install)
```





Homebrew must be installed manually: 


Rozetta must be installed manually:
softwareupdate --install-rosetta --agree-to-license


darwin-rebuild switch --flake .#mbp
