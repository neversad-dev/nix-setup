{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    baseIndex = 1; # start indexing windows at 1 instead of 0
    clock24 = true;
    escapeTime = 0;
    historyLimit = 50000;
    extraConfig = ''
        set -g @catppuccin_window_status_icon_enable "yes"
        set -g @catppuccin_icon_window_last "󰖰"
        set -g @catppuccin_icon_window_current "󰖯"
        set -g @catppuccin_icon_window_zoom "󰁌"
        set -g @catppuccin_icon_window_mark "󰃀"
        set -g @catppuccin_icon_window_silent "󰂛"
        set -g @catppuccin_icon_window_activity "󱅫"
        set -g @catppuccin_icon_window_bell "󰂞"
        set -g @catppuccin_status_background "theme"

        set -g @catppuccin_window_left_separator ""
        set -g @catppuccin_window_right_separator " "
        set -g @catppuccin_window_middle_separator " █"
        set -g @catppuccin_window_number_position "right"

        set -g @catppuccin_window_default_fill "number"
        set -g @catppuccin_window_default_text "#W"

        set -g @catppuccin_window_current_fill "number"
        set -g @catppuccin_window_current_text "#W"

        set -g @catppuccin_status_modules_right "directory user host session"
        set -g @catppuccin_status_left_separator  " "
        set -g @catppuccin_status_right_separator ""
        set -g @catppuccin_status_fill "icon"
        set -g @catppuccin_status_connect_separator "no"

        set -g @catppuccin_directory_text "#{pane_current_path}"


      # renumber all windows when any window is closed
      set-option -g renumber-windows on

      # Status at the top
      set-option -g status on
      set-option -g status-position top

      # easy-to-remember split pane commands
      bind | split-window -h -c "#{pane_current_path}"
      bind "\\" split-window -fh -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind _ split-window -fv -c "#{pane_current_path}"
      unbind '"'
      unbind %
      bind c new-window -c "#{pane_current_path}"
    '';
    keyMode = "vi";
    mouse = true;
    newSession = false; # Automatically spawn a session if trying to attach and none are running.
    shortcut = "b"; # CTRL following by this key is used as the main shortcut.
    terminal = "tmux-256color";
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator # TODO this overrides my system shortcuts. remove or replace them.
      # tmuxPlugins.cpu
      # tmuxPlugins.battery
    ];
  };
}
