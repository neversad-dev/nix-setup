# Nix darwin config for MacOS


## Prerequisites

1. Log in to App Store for installing apps from it.

   
2. Install nix:
  ```
  sh <(curl -L https://nixos.org/nix/install)
  ```
  after nix installed restart terminal.

3. Clone the repo
   with nix installed:
  ```
  nix-shell -p git --run "git clone https://github.com/GiveNoCode/nix-setup.git"
  ```

4. Change hostname if required:
   Apple menu  > System Settings > General > About > name

5. Install Xcode Command Line Tools
   ```
   xcode-select --install
   ```

7. Apply flake:
  ```
  cd nix-setup
  nix  --extra-experimental-features "nix-command flakes" run nix-darwin -- switch --flake .
  ```
   




Homebrew must be installed manually: 


Rozetta must be installed manually:
softwareupdate --install-rosetta --agree-to-license


darwin-rebuild switch --flake .#mbp
