{pkgs-unstable, ...}: {
  programs.zed-editor = {
    enable = true;
    package = pkgs-unstable.pkgs.zed-editor;

    extensions = [
      "catppuccin"
      "catppuccin-blur"
      "nix"
      "just"
      "basher"
      "xml"
    ];

    userKeymaps = [
      {
        context = "Workspace";
        bindings = {
          ctrl-shift-t = "workspace::NewTerminal";
        };
      }
    ];

    userSettings = {
      outline_panel = {
        dock = "right";
      };
      project_panel = {
        dock = "right";
      };

      theme = "Catppuccin Mocha (Blur)";
      autosave = "on_focus_change";
      tab_bar = {
        show = false;
        show_nav_history_buttons = false;
      };

      wrap_guides = [
        80
        120
      ];
      terminal = {
        font_family = "FiraCode Nerd Font Mono";
      };
      soft_wrap = "editor_width";
      format_on_save = "on";
      features = {
        copilot = false;
      };
      languages = {
        Markdown = {
          formatter = "prettier";
          format_on_save = "on";
        };
      };
      telemetry = {
        metrics = false;
      };
      vim_mode = false;
      ui_font_size = 16;
      buffer_font_size = 16;

      buffer_font_family = "FiraCode Nerd Font Mono";
    };
  };
}
