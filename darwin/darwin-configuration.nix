#
#  Main MacOS system configuration.
#
#  flake.nix
#   └─ ./darwin
#       ├─ default.nix
#       ├─ darwin-configuration.nix *
#       └─ ./modules
#           └─ default.nix
#

{ pkgs, vars, ... }:

{
  # imports = (import ./modules);

  users.users.${vars.user} = {
	  name = vars.user;
    home = "/Users/${vars.user}";
    shell = pkgs.zsh;
  };

  environment = {
    variables = {
      EDITOR = "${vars.editor}";
      VISUAL = "${vars.editor}";
    };
    systemPackages = with pkgs; [
        eza # Ls
        git # Version Control
        mas # Mac App Store $ mas search <app>
        ranger # File Manager
        tldr # Help
        #zsh-powerlevel10k # Prompt

        zsh
        wget
        zsh-autosuggestions
        zsh-autocomplete
        zsh-syntax-highlighting
        kitty
        starship
        neovim
        tmux 
        raycast
        alt-tab-macos
        hidden-bar
        monitorcontrol
        stats
    ];
  };

  programs.zsh.enable = true;

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    casks = [
     # "aldente"
    #  "appcleaner"
     # "firefox"
     # "moonlight"
     # "obs"
     # "plex"
      #"prusaslicer"
      #"raycast"
      #"stremio"
      #"vlc"
      # "canon-eos-utility"
      # "jellyfin-media-player"


        "firefox"
        "google-chrome"
        "the-unarchiver"
        "chatgpt"
        "itsycal"
    ];
    masApps = {
      "wireguard" = 1451685025;
	  "Bitwarden" = 1352778147;
    };
  };

  home-manager.users.${vars.user} = {
    home.stateVersion = "24.05";
  };

  services.nix-daemon.enable = true;

  nix = {
    package = pkgs.nix;
    gc = {
      automatic = true;
      interval.Day = 7;
      options = "--delete-older-than 7d";
    };
    extraOptions = ''
      # auto-optimise-store = true
      experimental-features = nix-command flakes
    '';
  };

  system = {
    stateVersion = 5;
  };
}