#
#  Specific system configuration settings for MacBook Pro M1 18,3
#
#  flake.nix
#   └─ ./darwin
#       ├─ default.nix
#       └─ ./m1.nix *
#

{ pkgs, vars, ... }:

{
    environment = {
        systemPackages = with pkgs; [
        ];
    };

    homebrew = {
        casks = [
            #"adobe-creative-cloud"
            #"darktable"
            #"deluge"
            #"docker"
            #"docker-toolbox"
            #"garmin-express"
            #"google-chrome"
            #"obsidian"
            #"upscayl"
            #"xnviewmp"
        ];
        masApps = {
            # "FileZilla Pro - FTP and Client" = 1298486723;
            # "FileZilla Pro RemoteDrive" = -2087754162;
            #"Keynote" = 409183694;
            #"Microsoft Remote Desktop" = 1295203466;
            #"Numbers" = 409203825;
            #"Pages" = 409201541;
            #"Xcode" = 497799835;
        };
    };

    system = {
        defaults = {
            LaunchServices.LSQuarantine = false;
            NSGlobalDomain = {
                AppleICUForce24HourTime = true;
                AppleInterfaceStyle = "Dark";
                AppleMeasurementUnits = "Centimeters";
                AppleMetricUnits = 1;
                AppleShowAllExtensions = true;
                NSAutomaticCapitalizationEnabled = false;
                NSAutomaticSpellingCorrectionEnabled = false;
                AppleShowAllFiles = true;
                "com.apple.mouse.tapBehavior" = 1;
                "com.apple.trackpad.enableSecondaryClick" = true;
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
            trackpad = {
                Clicking = true;
                TrackpadRightClick = true;
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
                ShowDate = 2;     # 0 = When space allows 1 = Always 2 = Never
                ShowDayOfWeek = false;
            };
            CustomUserPreferences = {
                # Settings of plist in ~/Library/Preferences/
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
                "com.apple.desktopservices" = {
                    # Disable creating .DS_Store files in network an USB volumes
                    DSDontWriteNetworkStores = true;
                    DSDontWriteUSBStores = true;
                };
                # Privacy
                "com.apple.AdLib".allowApplePersonalizedAdvertising = false;
            };
            screencapture.location = "~/Pictures/screenshots";
            screensaver.askForPasswordDelay = 10;
            spaces.spans-displays = false;
            trackpad.TrackpadThreeFingerDrag = true;
            universalaccess.reduceMotion = true;
        };
    };

    fonts.packages = 
        [
            pkgs.meslo-lgs-nf
        ];


    system.keyboard = {
        enableKeyMapping = true;
        remapCapsLockToControl = true;
    };


    security.pam.enableSudoTouchIdAuth = true;
}