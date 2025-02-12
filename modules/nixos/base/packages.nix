{pkgs, ...}: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neofetch
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    just # justfile

    # system monitoring
    # sysstat
    # iotop
    # iftop
    btop
    # nmon
    # sysbench

  ];

  # replace default editor with neovim
  environment.variables.EDITOR = "nvim";
}
