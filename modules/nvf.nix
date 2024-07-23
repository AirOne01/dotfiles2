{pkgs, ...}: {
  home.packages = with pkgs; [
    noto-fonts-color-emoji
  ];

  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        autocomplete.enable = true;

        lsp = {
          enable = true;

          formatOnSave = true;

          # show code actions even when there are no lsp warns/errors
          lightbulb.enable = true;

          # "signature": box that appears when e.g. you start typing args of a function
          lspSignature.enable = true;

          # pictograms
          lspkind.enable = true;

          # lines showing errors
          lsplines.enable = true;

          # advanced lsp framework
          lspsaga = {
            enable = true;
          };

          null-ls.enable = true;
        };

        # minimap (braille map of the document on the right-side of the screen)
        # using `codewindow` bc more customization than `minimap-vim`
        minimap.codewindow.enable = true;

        # notification library
        notify.nvim-notify.enable = true;

        # spoken/written languages
        spellcheck = {
          enable = true;

          languages = [
            "en"
            # TODO add "fr" here and configure dictionary
          ];
        };

        # lsp languages
        languages = {
          # for each enabled language below:
          enableDAP = true;
          enableExtraDiagnostics = true;
          enableFormat = true;
          enableLSP = true;
          enableTreesitter = true;

          # programming/scripting/configuration languages list
          html.enable = true;
          nix.enable = true;
          ts = {
            enable = true;

            extensions = {
              # make errors readable
              ts-error-translator.enable = true;
            };

            lsp.package = pkgs.nodePackages.typescript-language-server;
          };
        };

        statusline.lualine = {
          enable = true;

          theme = "nightfly";

          activeSection = {
            a = [
              ''
                {
                  "mode",
                  icons_enabled = true,
                  separator = { right = '' }
                }
              ''
            ];
            b = [
              ''
                {
                  "filetype",
                  colored = true,
                  icon_only = true,
                  icon = { align = 'left' },
                }
              ''
              ''
                {
                  "filename",
                  symbols = { modified = ' ', readonly = ' ' },
                }
              ''
            ];
            c = [
              ''
                {
                  "diff",
                  colored = false,
                  diff_color = {
                    -- Same color values as the general color option can be used here
                    added    = 'DiffAdd',    -- Changes the diff's added color
                    modified = 'DiffChange', -- Changes the diff's modified color
                    removed  = 'DiffDelete', -- Changes the diff's removed color
                  },
                  symbols = { added = ' ', modified = ' ', removed = ' ' } -- Change the diff symbol
                }
              ''
            ];
            z = [
              ''
                {
                  "",
                  draw_empty = true,
                  separator = { left = '' }
                }
              ''
              ''
                { "progress" }
              ''
              ''
                { "location" }
              ''
              ''
                {
                  "fileformat",
                  color = { fg = 'black' },
                  symbols = {
                    unix = '', -- e712
                    dos = '',  -- e70f
                    mac = '',  -- e711
                  }
                }
              ''
            ];
          };
        };

        treesitter = {
          enable = true;

          # (x?)html tag auto rename
          autotagHtml = true;

          context = {
            enable = true;
          };
        };

        filetree.nvimTree = {
          enable = true;

          setupOpts = {
            actions.open_file.eject = true;

            # show lsp warns/errors on file tree
            diagnostics.enable = true;

            # "hijack the cursor in the tree to put it at the start of the filename"
            hijack_cursor = true;

            renderer = {
              icons.git_placement = "after";
            };
          };
        };

        telescope = {
          enable = true;
        };

        theme = {
          name = "tokyonight";
          style = "darker";
        };

        visuals = {
          enable = true;

          # hmm...
          cellularAutomaton = {
            #enable = true;
            # default bind is "<leader>fml"
            # ...for "fuck my life"
          };
          # highlight cursor
          cursorline.enable = true;
          # icons
          nvimWebDevicons.enable = true;
          # notification widget
          fidget-nvim = {
            enable = true;

            setupOpts = {
              # TODO: setup options here

              # nvim-tree
              integration.nvim-tree.enable = true;
              # widget
              notification.window.winblend = 75; # opacity%
            };
          };
          # highlight undo/redo
          highlight-undo.enable = true;
          # indent blankline
          indentBlankline = {
            enable = true;

            setupOpts.scope.enabled = true;
          };
          # scollbar
          scrollBar.enable = true;
          smoothScroll.enable = true;
        };
      };
    };
  };
}
