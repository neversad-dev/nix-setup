{ pkgs, ... }:

  ###################################################################################
  #
  #  macOS's System configuration
  #
  #  All the configuration options are documented here:
  #    https://daiderd.com/nix-darwin/manual/index.html#sec-options
  #  Incomplete list of macOS `defaults` commands :
  #    https://github.com/yannbertrand/macos-defaults
  #
  ###################################################################################
{
  system = {
    stateVersion = 5;
    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    defaults = {
      LaunchServices.LSQuarantine = false;
      # customize dock
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

      # customize finder
      finder = {
        _FXSortFoldersFirst = true;
        _FXShowPosixPathInTitle = true;  # show full path in finder title
        AppleShowAllExtensions = true;  # show all file extensions
        AppleShowAllFiles = true;
        CreateDesktop = false;
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;  # disable warning when changing file extension
        FXPreferredViewStyle = "clmv";
        QuitMenuItem = true;  # enable quit menu item
        ShowPathbar = true;  # show path bar
        ShowStatusBar = true;  # show status bar
      };

      # customize trackpad
      trackpad = {
        Clicking = true;  # enable tap to click(Tapping the touchpad is equivalent to clicking)
        TrackpadRightClick = true;  # enable two finger right click
        TrackpadThreeFingerDrag = true;  # enable three finger drag
      };

      # customize settings that not supported by nix-darwin directly
      # Incomplete list of macOS `defaults` commands :
      #   https://github.com/yannbertrand/macos-defaults
      NSGlobalDomain = {
        # `defaults read NSGlobalDomain "xxx"`
         _HIHideMenuBar = false;
        "com.apple.swipescrolldirection" = true;  # enable natural scrolling(default to true)
        "com.apple.sound.beep.feedback" = 0;  # disable beep sound when pressing volume up/down key
        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.trackpad.enableSecondaryClick" = true;
        AppleICUForce24HourTime = true;
        AppleInterfaceStyle = "Dark";  # dark mode
        AppleMeasurementUnits = "Centimeters";
        AppleTemperatureUnit = "Celsius";
        AppleMetricUnits = 1;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;

        AppleKeyboardUIMode = 3;  # Mode 3 enables full keyboard control.
        ApplePressAndHoldEnabled = true;  # enable press and hold

        # If you press and hold certain keyboard keys when in a text area, the key’s character begins to repeat.
        # This is very useful for vim users, they use `hjkl` to move cursor.
        # sets how long it takes before it starts repeating.
        InitialKeyRepeat = 15;  # normal minimum is 15 (225 ms), maximum is 120 (1800 ms)
        # sets how fast it repeats once it starts. 
        KeyRepeat = 3;  # normal minimum is 2 (30 ms), maximum is 120 (1800 ms)

        NSAutomaticCapitalizationEnabled = false;  # disable auto capitalization(自动大写)
        NSAutomaticDashSubstitutionEnabled = false;  # disable auto dash substitution(智能破折号替换)
        NSAutomaticPeriodSubstitutionEnabled = false;  # disable auto period substitution(智能句号替换)
        NSAutomaticQuoteSubstitutionEnabled = false;  # disable auto quote substitution(智能引号替换)
        NSAutomaticSpellingCorrectionEnabled = false;  # disable auto spelling correction(自动拼写检查)
        NSNavPanelExpandedStateForSaveMode = true;  # expand save panel by default(保存文件时的路径选择/文件名输入页)
        NSNavPanelExpandedStateForSaveMode2 = true;
      };
      WindowManager = {
        EnableStandardClickToShowDesktop = false;
        StandardHideDesktopIcons = true;
        StandardHideWidgets = true;
      };
      menuExtraClock = {
        IsAnalog = false;
        Show24Hour = true;
        ShowDate = 2;     # 0 = When space allows 1 = Always 2 = Never
        ShowDayOfWeek = false;
      };


      # Customize settings that not supported by nix-darwin directly
      # see the source code of this project to get more undocumented options:
      #    https://github.com/rgcr/m-cli
      # 
      # All custom entries can be found by running `defaults read` command.
      # or `defaults read xxx` to read a specific domain.
      CustomUserPreferences = {

        ".GlobalPreferences" = {
          # automatically switch to a new space when switching to the application
          AppleSpacesSwitchOnActivate = true;
        };
        NSGlobalDomain = {
          # Add a context menu item for showing the Web Inspector in web views
          WebKitDeveloperExtras = true;
        };
        "com.apple.finder" = {
          ShowExternalHardDrivesOnDesktop = true;
          ShowHardDrivesOnDesktop = true;
          ShowMountedServersOnDesktop = true;
          ShowRemovableMediaOnDesktop = true;
          _FXSortFoldersFirst = true;
          # When performing a search, search the current folder by default
          FXDefaultSearchScope = "SCcf";
        };
        "com.apple.desktopservices" = {
          # Avoid creating .DS_Store files on network or USB volumes
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        "com.apple.spaces" = {
          "spans-displays" = 0; # Display have seperate spaces
        };
        "com.apple.WindowManager" = {
          EnableStandardClickToShowDesktop = 0; # Click wallpaper to reveal desktop
          StandardHideDesktopIcons = 1; # Hide items on desktop
          HideDesktop = 1; # Hide items on desktop & stage manager
          StageManagerHideWidgets = 1;
          StandardHideWidgets = 1;
        };
        "com.apple.screensaver" = {
          # Require password immediately after sleep or screen saver begins
          askForPassword = 1;
          askForPasswordDelay = 0;
        };
        "com.apple.screencapture" = {
          location = "~/Pictures/screenshots";
          type = "png";
        };
        "com.apple.AdLib" = {
          allowApplePersonalizedAdvertising = false;
        };
        # Prevent Photos from opening automatically when devices are plugged in
        "com.apple.ImageCapture".disableHotPlug = true;
        "com.apple.symbolichotkeys" = {
          AppleSymbolicHotKeys = {
              "64" = { enabled = false; }; # ShowLaunchpad shortcut
              "118" = { enabled = true; }; # Control + 1
              "119" = { enabled = true; }; # Control + 2
              "120" = { enabled = true; }; # Control + 3
              "121" = { enabled = true; }; # Control + 4
              "122" = { enabled = true; }; # Control + 5
              "123" = { enabled = true; }; # Control + 6
              "124" = { enabled = true; }; # Control + 7
              "125" = { enabled = true; }; # Control + 8
              "126" = { enabled = true; }; # Control + 9
              # Override Move Left a Space with Control + H
              "79" = {
                  enabled = true; # Enable the new binding
                  value = {
                      parameters = ( [ 104 4 262144 ] );# Control + H key combination
                      type = "standard";
                  };
              };

              # Override Move Left a Space with Control + L
              "81" = {
                  enabled = true; # Enable the new binding
                  value = {
                      parameters = ([ 108 37 262144 ] ); # Control + L key combination
                      type = "standard";
                  };
              };

              # Override Mission Controle with Control + K
              "32" = {
                  enabled = true; # Enable the new binding
                  value = {
                      parameters = ([107 40 262144]);
                      type = "standard";
                  };
              };

              # Override Application windows with Control + J
              "33" = {
                  enabled = true; # Enable the new binding
                  value = {
                      parameters = ([106 38 262144]);
                      type = "standard";
                  };
              };
          };
        };
      };
      loginwindow = {
        GuestEnabled = false;  # disable guest user
        SHOWFULLNAME = true;  # show full name in login window
      };
      universalaccess.reduceMotion = true;
    };

    # keyboard settings is not very useful on macOS
    # the most important thing is to remap option key to alt key globally,
    # but it's not supported by macOS yet.
    keyboard = {
      enableKeyMapping = true;  # enable key mapping so that we can use `option` as `control`

      # NOTE: do NOT support remap capslock to both control and escape at the same time
      remapCapsLockToControl = false;  # remap caps lock to control, useful for emac users
      remapCapsLockToEscape  = true;   # remap caps lock to escape, useful for vim users

      # swap left command and left alt 
      # so it matches common keyboard layout: `ctrl | command | alt`
      #
      # disabled, caused only problems!
      swapLeftCommandAndLeftAlt = false;  
    };
  };

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  programs.zsh.enable = true;
  environment.shells = [
    pkgs.zsh
  ];

  # Set your time zone.
  time.timeZone = "Europe/Kyiv";

  # Fonts
  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-design-icons
      font-awesome
      # meslo-lgs-nf

      # nerdfonts
      # https://github.com/NixOS/nixpkgs/blob/nixos-24.05/pkgs/data/fonts/nerdfonts/shas.nix
      (nerdfonts.override {
        fonts = [
          # symbols icon only
          "NerdFontsSymbolsOnly"
          # Characters
          "FiraCode"
          "JetBrainsMono"
          "Iosevka"
        ];
      })
    ];
  };
}