{pkgs, nvf, ...}: let 
  inherit (pkgs.vimPlugins) vim-tmux-navigator;
in {
  imports = [
    nvf.homeManagerModules.default
  ];

  programs.nvf = {
    enable = true;
    defaultEditor = true;

    settings.vim = {
      # Open Neovim whenever "vi" or "vim" command is executed
      viAlias = true;
      vimAlias = true;

      syntaxHighlighting = true;
      useSystemClipboard = true;

      lsp = {
        enable = true;
        formatOnSave = true;
        lightbulb.enable = true;
        lspsaga.enable = false;
        trouble.enable = true;
        lspSignature.enable = true;
      };

      languages = {
        enableLSP = true;
        enableTreesitter = true;
        enableFormat = true;
        enableExtraDiagnostics = true;

        html = {
          enable = true;
          treesitter.enable = true;
          treesitter.autotagHtml = true;
        };

        go = {
          enable = true;
          lsp.enable = true;
          treesitter.enable = true;
        };

        java = {
          enable = true;
          lsp.enable = true;
          treesitter.enable = true;
        };

        lua = {
          enable = true;
          lsp.enable = true;
          treesitter.enable = true;
        };

        markdown = {
          enable = true;
          format.enable = true;
          lsp.enable = true;
          treesitter.enable = true;
        };

        nix = {
          enable = true;
          extraDiagnostics.enable = true;
          format.enable = true;
          lsp.enable = true;
          treesitter.enable = true;
        };

        python = {
          enable = true;
          dap.enable = true;
          format.enable = true;
          lsp.enable = true;
          treesitter.enable = true;
        };
      };

      theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
        transparent = false;
      };

      statusline.lualine = {
        enable = true;
        globalStatus = true;
        icons.enable = true;
      };

      telescope.enable = true;

      extraPlugins = {
        vim-tmux-navigator = {
          package = vim-tmux-navigator;
        };
      };

    };
  };
}
