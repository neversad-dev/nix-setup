{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [
    inputs.catppuccin-vsc.overlays.default
    inputs.nix-vscode-extensions.overlays.default
  ];

  programs.vscode = {
    enable = true;

    extensions = with pkgs; [
      # all the theme options will be available as overrides, these are defaults:
      (catppuccin-vsc.override {
        accent = "mauve";
        boldKeywords = true;
        italicComments = true;
        italicKeywords = true;
        extraBordersEnabled = false;
        workbenchMode = "default";
        bracketMode = "rainbow";
        colorOverrides = {};
        customUIColors = {};
      })
      vscode-marketplace.catppuccin.catppuccin-vsc-icons
      vscode-marketplace.jeff-hykin.better-nix-syntax
      vscode-marketplace.jnoortheen.nix-ide
    ];

    userSettings = {
      #  - all: Sends usage data, errors, and crash reports.
      #  - error: Sends general error telemetry and crash reports.
      #  - crash: Sends OS level crash reports.
      #  - off: Disables all product telemetry.
      "telemetry.telemetryLevel" = "off";

      "diffEditor.ignoreTrimWhitespace" = false;

      "editor.detectIndentation" = true;
      "editor.fontFamily" = "Hack Nerd Font Mono";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 14;
      "editor.formatOnPaste" = false;
      "editor.inlineSuggest.enabled" = true;
      "editor.lineHeight" = 0;
      "editor.linkedEditing" = true;
      "editor.minimap.enabled" = false;
      "editor.multiCursorModifier" = "ctrlCmd";
      "editor.snippetSuggestions" = "top";
      "editor.suggestSelection" = "first";
      "editor.tabSize" = 4;

      # we try to make semantic highlighting look good
      "editor.semanticHighlighting.enabled" = true;
      # prevent VSCode from modifying the terminal colors
      "terminal.integrated.minimumContrastRatio" = 1;
      # make the window's titlebar use the workbench colors
      "window.titleBarStyle" = "custom";

      "extensions.ignoreRecommendations" = true;

      "files.autoSave" = "onWindowChange";

      "git.autofetch" = true;
      "git.openRepositoryInParentFolders" = "never";

      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.editor.labelFormat" = "medium";
      "workbench.editor.showTabs" = "none";
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.sideBar.location" = "right";
      "workbench.startupEditor" = "newUntitledFile";
      "workbench.statusBar.visible" = false;

      "[nix]"."editor.tabSize" = 2;
    };
  };
}
