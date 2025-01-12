{
  pkgs,
  nvf,
  ...
}: {
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

      enableLuaLoader = true;

      globals.mapleader = " ";
      lineNumberMode = "relNumber";
      spellcheck.enable = true;
      preventJunkFiles = true;
      syntaxHighlighting = true;
      useSystemClipboard = true;
      disableArrows = false;

      visuals = {
        nvim-web-devicons.enable = true;
        nvim-scrollbar.enable = true;
        indent-blankline.enable = true;
        cinnamon-nvim.enable = true;
        cellular-automaton = {
          enable = true;
          mappings.makeItRain = "<leader>mir";
        };
      };

      options = {
        # Indentation
        "shiftwidth" = 2;
        "tabstop" = 2;
        "softtabstop" = 2;
        "smartindent" = false;
        "expandtab" = true; # Use spaces for indentation

        # Code folding
        "foldmethod" = "expr";
        "foldexpr" = "nvim_ufo#foldexpr()";
        "foldcolumn" = "0";
        "foldlevel" = 99;
        "foldlevelstart" = 99;
        "foldenable" = true;

        # File encoding
        "encoding" = "utf-8";
        "fileencoding" = "utf-8";
      };

      binds.cheatsheet.enable = true;
      maps = {
        normal = {
          "lg" = {
            silent = true;
            action = "<cmd>LazyGit<CR>";
          };

          # Nvim UFO
          "zR".action = "require('ufo').openAllFolds";
          "zM".action = "require('ufo').closeAllFolds";
        };
      };

      theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
        transparent = false;
      };

      notify.nvim-notify.enable = true;
      ui = {
        noice.enable = true;
        breadcrumbs.enable = true;
        colorizer.enable = true;
        fastaction.enable = true;
      };

      statusline.lualine = {
        enable = true;
        theme = "auto";
        globalStatus = true;
        icons.enable = true;
      };

      treesitter = {
        enable = true;
        addDefaultGrammars = true;
        autotagHtml = true;
        highlight = {
          enable = true;
        };
      };

      lsp = {
        enable = true;
        formatOnSave = true;

        lightbulb.enable = true; # Show code suggestions
        lspSignature.enable = true; # Show function signature when typing
        lsplines.enable = true; # Show LSP diagnostics on top of line of code

        lspkind = {
          enable = true;
        };

        mappings = {
          hover = "<leader>k";
          codeAction = "<leader>ca";
          format = "<leader>cf";
        };
      };

      filetree.nvimTree = {
        enable = true;
        openOnSetup = false;
        mappings.toggle = "<C-n>";
        setupOpts = {
          # Disable the default Neovim file explorer
          disable_netrw = true;

          # Indicate unsaved modifications
          modified = {
            enable = true;
            show_on_dirs = true;
          };
          # Close file explorer upon opening a file and any window displaying a file when removing the file from the tree
          actions = {
            change_dir.enable = true;
            change_dir.global = false;
            use_system_clipboard = true; # Use the system clipboard when copy/paste functions are invoked
            open_file.quit_on_open = true; # Close file explorer upon opening a file
            remove_file.close_window = true; # Close any window displaying a file when it's removed from the file tree
          };

          # Show LSP and COC diagnostics in the signcolumn - Modified sign takes precedence over this
          diagnostics = {
            enable = true;
            show_on_dirs = true;
          };

          # Filter files in the file explorer
          filters = {
            dotfiles = false; # Show files starting with a fullstop
            git_ignored = true; # Ignore files based on '.gitignore'
            exclude = [];
          };

          # Git integration
          git = {
            enable = true;
            show_on_dirs = true; # Show Git icons on parent directories
          };
        };
      };

      autopairs.nvim-autopairs.enable = true;
      autocomplete.nvim-cmp = {
        enable = true;
        mappings = {
          close = "<C-e>";
          complete = "<C-Space>";
          confirm = "<CR>";
          next = "<Tab>";
          previous = "<S-Tab>";
          scrollDocsUp = "<C-d>";
          scrollDocsDown = "<C-f>";
        };
      };

      # Git integration
      git = {
        enable = true;
        gitsigns.enable = true;
      };

      languages = {
        enableTreesitter = true;
        enableLSP = true;
        enableFormat = true;
        enableDAP = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        markdown.enable = true;
        lua.enable = true;
        java.enable = true;
        kotlin.enable = true;
      };

      telescope = {
        enable = true;
        mappings = {
          findFiles = "<leader>ff";
        };
      };

      extraPlugins = with pkgs.vimPlugins; {
        lazygit.package = lazygit-nvim;
        vim-tmux-navigator = {
          package = vim-tmux-navigator;
        };
        # Code folding
        nvim-ufo = {
          package = nvim-ufo;
          setup = "require('ufo').setup()";
        };
      };
    };
  };
}
