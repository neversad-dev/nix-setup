{
  pkgs,
  pkgs-unstable,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs-unstable.vscode;

    mutableExtensionsDir = true;
    extensions = with pkgs;
    with vscode-marketplace; [
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
      catppuccin.catppuccin-vsc-icons
      esbenp.prettier-vscode
      christian-kohler.path-intellisense
      naumovs.color-highlight
      gruntfuggly.todo-tree
      oderwat.indent-rainbow
      wmaurer.change-case
      ms-azuretools.vscode-docker
      editorconfig.editorconfig

      bierner.github-markdown-preview
      bierner.markdown-preview-github-styles
      bierner.markdown-emoji
      bierner.markdown-checkbox
      bierner.markdown-yaml-preamble
      bierner.markdown-footnotes
      bierner.markdown-mermaid
      bierner.markdown-image-size
      bierner.emojisense
      davidanson.vscode-markdownlint

      jeff-hykin.better-nix-syntax
      jnoortheen.nix-ide
      kamadorueda.alejandra

      redhat.java
      mathiasfrohlich.kotlin

      nefrob.vscode-just-syntax

      mads-hartmann.bash-ide-vscode
      timonwong.shellcheck
      mkhl.shfmt

      redhat.vscode-xml
      redhat.vscode-yaml
      tamasfe.even-better-toml
      mechatroner.rainbow-csv
      zainchen.json
      irongeek.vscode-env

      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-ssh-edit
      ms-vscode.remote-explorer
      eamodio.gitlens
    ];

    userSettings = {
      #  - all: Sends usage data, errors, and crash reports.
      #  - error: Sends general error telemetry and crash reports.
      #  - crash: Sends OS level crash reports.
      #  - off: Disables all product telemetry.
      "telemetry.telemetryLevel" = "off";
      "redhat.telemetry.enabled" = false;

      "diffEditor.ignoreTrimWhitespace" = false;

      "editor.detectIndentation" = true;
      "editor.fontFamily" = "FiraCode Nerd Font Mono";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 14;
      "editor.formatOnSave" = true;
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

      "editor.guides.highlightActiveIndentation" = false;

      # Using the light mode
      "indentRainbow.indicatorStyle" = "light";
      # we use a simple 1 pixel wide line
      "indentRainbow.lightIndicatorStyleLineWidth" = 1;
      # # the same colors as above but more visible
      "indentRainbow.colors" = [
        "rgba(243, 139, 168, 0.3)" # #f38ba8
        "rgba(250, 181, 135, 0.3)" # #fab387
        "rgba(249, 226, 175, 0.3)" # #f9e2af
        "rgba(166, 227, 161, 0.3)" # #a6e3a1
        "rgba(137, 180, 250, 0.3)" # #89b4fa
        "rgba(203, 166, 247, 0.3)" # #cba6f7
      ];
      "editor.defaultFormatter" = "esbenp.prettier-vscode";

      "[markdown]" = {
        "editor.defaultFormatter" = "DavidAnson.vscode-markdownlint";
      };

      "nix.enableLanguageServer" = true; # Enable LSP.
      "nix.serverPath" = "nil"; # The path to the LSP server executable.
      "[nix]" = {
        "editor.defaultFormatter" = "kamadorueda.alejandra";
      };
      "alejandra.program" = "alejandra";

      "[shellscript]" = {
        "editor.defaultFormatter" = "mkhl.shfmt";
      };
    };
  };
}
