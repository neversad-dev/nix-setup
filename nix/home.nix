{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "tinker";
  home.homeDirectory = "/Users/tinker";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  home.packages = with pkgs; [
    starship
    zsh-autosuggestions
    zsh-autocomplete
    zsh-syntax-highlighting
    fzf
    zoxide
    bat
  ];

  programs.zsh = {
    enable = true;
    # ohMyZsh.enable = false;  # Disable Oh My Zsh if you have it installed
    initExtra = ''
      # Initialize Starship prompt
      eval "$(starship init zsh)"

      # Source Zsh plugins
      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      source ${pkgs.zsh-autocomplete}/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
      source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
      
      # Set up fzf key bindings and fuzzy completion
      eval "$(fzf --zsh)"

      # Set up zoxide for better cd
      eval "$(zoxide init --cmd cd zsh)"
    '';

  };

  
  # Create a symlink for the starship.toml file
  home.file.".config/starship.toml".source = ../starship.toml;

  # Create a symlink for the kitty config
  home.file.".config/kitty".source = ../kitty;

  # Create a symlink for git files
  home.file.".gitignore".source = ../git/.gitignore;
  home.file.".gitconfig".source = ../git/.gitconfig;

  # Enable Starship
  programs.starship.enable = true;

  # Bat (better cat)
  home.file.".config/bat".source = ../bat;
}
