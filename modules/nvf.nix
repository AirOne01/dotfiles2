_: {
  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        lsp = {
          enable = true;
        };

        languages = {
          nix = {
            enable = true;
            treesitter.enable = true;
          };
          ts = {
            enable = true;
            treesitter.enable = true;
          };
          html = {
            enable = true;
            treesitter.enable = true;
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
                  separator = {
                    right = '',
                  },
                }
              ''
            ];
            b = [
              ''
                {
                  "filetype",
                  colored = true,
                  icon_only = true,
                  icon = { align = 'left' }
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
