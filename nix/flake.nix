{
  description = "My Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
          pkgs.alacritty
	  pkgs.neovim
          pkgs.tmux 
	  pkgs.git
        ];

      homebrew = {
        enable = true;
	brews = [
	];
	casks = [
	  "firefox"
	  "google-chrome"
	  "the-unarchiver"
	];
	masApps = {
	  "Bitwarden" = 1352778147;
	};
	onActivation.cleanup = "zap";
	onActivation.autoUpdate = true;
	onActivation.upgrade = true;
      };

      fonts.packages = 
        [
          pkgs.hackgen-nf-font
        ];

      system.defaults = {
        LaunchServices.LSQuarantine = false;
	NSGlobalDomain = {
	  AppleICUForce24HourTime = true;
	  AppleInterfaceStyle = "Dark";
	  AppleMeasurementUnits = "Centimeters";
	  AppleMetricUnits = 1;
	  AppleShowAllExtensions = true;
	  AppleShowAllFiles = true;
	  AppleTemperatureUnit = "Celsius";
	  KeyRepeat = 2;
	  _HIHideMenuBar = false;
	};
 	dock = {
	  autohide = true;	
	  autohide-time-modifier = 0.0;
	  launchanim = false;
	  mineffect = "scale";
	  mru-spaces = false;
	  orientation = "left";
	  persistent-apps = [];
	  persistent-others = [];
	  show-recents = false;
	  tilesize = 10;
	  wvous-tl-corner = 1;
	  wvous-tr-corner = 1;
	  wvous-bl-corner = 1;
	  wvous-br-corner = 1;	
	};
	finder = {
	  AppleShowAllExtensions = true;
	  AppleShowAllFiles = true;
	  CreateDesktop = false;
	  FXDefaultSearchScope = "SCcf";
	  FXEnableExtensionChangeWarning = false;
	  FXPreferredViewStyle = "clmv";
	  QuitMenuItem = true;
	  ShowPathbar = true;
	  ShowStatusBar = true;
	  _FXSortFoldersFirst = true;
	};
	WindowManager = {
	  EnableStandardClickToShowDesktop = false;
	  StandardHideDesktopIcons = true;
	  StandardHideWidgets = true;
	};
	loginwindow.GuestEnabled = false;
	menuExtraClock = {
	  IsAnalog = false;
	  Show24Hour = true;
	  ShowDate = 1;     # 0 = When space allows 1 = Always 2 = Never
	};
	screencapture.location = "~/Pictures/screenshots";
	screensaver.askForPasswordDelay = 10;
	spaces.spans-displays = false;
	trackpad.TrackpadThreeFingerDrag = true;
	universalaccess.reduceMotion = true;
      };

      system.keyboard = {
        enableKeyMapping = true;
        remapCapsLockToControl = true;
      };

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      security.pam.enableSudoTouchIdAuth = true;

      users.users.tinker = {
  	name = "tinker";
  	home = "/Users/tinker";
      };
      home-manager.backupFileExtension = "backup";
      nix.configureBuildUsers = true;
      nix.useDaemon = true;

    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."mbp" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration 
	nix-homebrew.darwinModules.nix-homebrew
	{
          nix-homebrew = {
            enable = true;
	                
	    # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
            enableRosetta = true;

            # User owning the Homebrew prefix
            user = "tinker";

	    # Automatically migrate existing Homebrew installations
            # autoMigrate = true;

            # Optional: Enable fully-declarative tap management
            #
            # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
            # mutableTaps = false;
	  };
        }
	home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.tinker = import ./home.nix;
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."mbp".pkgs;
  };
}
