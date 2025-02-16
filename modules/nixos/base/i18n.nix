{pkgs, ... }: {
  # Set your time zone.
  time.timeZone = "Europe/Kyiv";


  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_MEASUREMENT = "uk_UA.UTF-8";
    LC_NUMERIC = "uk_UA.UTF-8";
    LC_PAPER = "uk_UA.UTF-8";
    LC_TELEPHONE = "uk_UA.UTF-8";
    LC_TIME = "uk_UA.UTF-8";
  };

  # Override date format globally
  environment.variables = {
    LC_TIME = "uk_UA.UTF-8";  # Apply this globally, making sure GUI apps use the format
  };

  # Apply the YYYY-MM-DD date format as alias for both Bash and Zsh
  programs.bash = {
    shellAliases = {
     date="date +%F";  # Forces YYYY-MM-DD format in Bash
    };
  };

  programs.zsh = {
    shellAliases = {
     date="date +%F";  # Forces YYYY-MM-DD format in Zsh
    };
  };

}
