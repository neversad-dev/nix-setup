{pkgs, ...}: {
  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment.systemPackages = with pkgs; [
    neovim
    git
  ];
  environment.variables.EDITOR = "nvim";
  environment.variables.VISUAL = "nvim";

  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  programs.zsh.enable = true;
  environment.shells = [
    pkgs.zsh
  ];

  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true; # Fetch the newest stable branch of Homebrew's git repo
      upgrade = true; # Upgrade outdated casks, formulae, and App Store apps
      # 'zap': uninstalls all formulae(and related files) not listed in the generated Brewfile
      cleanup = "zap";
    };

    # Applications to install from Mac App Store using mas.
    # You need to install all these Apps manually first so that your apple account have records for them.
    # otherwise Apple Store will refuse to install them.
    # For details, see https://github.com/mas-cli/mas
    masApps = {
      Xcode = 497799835;
      wireguard = 1451685025;
      Bitwarden = 1352778147;
    };

    taps = [
      "homebrew/services"
    ];

    # `brew install`
    brews = [
      "wget" # download tool
      "curl" # no not install curl via nixpkgs, it's not working well on macOS!
    ];

    # `brew install --cask`
    casks = [
      "kitty"
      "firefox"
      "google-chrome"
      "the-unarchiver"
      "zed"
      "alt-tab"
      "hiddenbar"

      # messengers
      "telegram"
      "viber"
      "signal"

      "chatgpt"
      "itsycal"
      "iina"
      "raycast" # (HotKey: alt/option + space)search, calculate and run scripts(with many plugins)
      "stats" # beautiful system status monitor in menu bar
      "monitorcontrol"
    ];
  };
}
