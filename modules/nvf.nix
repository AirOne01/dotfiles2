{pkgs, ...}: {
  home.packages = with pkgs; [
    # for lightbulb emoji
    noto-fonts-color-emoji
    # image display backend
    ueberzug
  ];

  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;

      autocomplete.enable = true;

      syntaxHighlighting = true;

      tabWidth = 2;

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

      # nvimBufferline
      tabline.nvimBufferline = {
        enable = true;

        mappings = {
          closeCurrent = "<leader>x";
          cycleNext = "<tab>";
          cyclePrevious = "<shift><tab>";
        };

        setupOpts.options = {
          middle_mouse_command = {
            _type = "lua-inline";
            expr = ''
              function(bufnum)
                require("bufdelete").bufdelete(bufnum, false)
              end
            '';
          };
          numbers = "none";
          separator_style = "slant";
        };
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

        theme = "horizon";

        activeSection = {
          a = [
            ''
              {
                "mode",
                icons_enabled = true,
                separator = {
                  right = ''
                },
              }
            ''
            ''
              {
                "",
                draw_empty = true,
                separator = { left = '', right = '' }
              }
            ''
          ];
          b = [
            ''
              {
                "branch",
                icon = '',
                separator = {left = ''}
              }
            ''
            ''
              {
                "",
                draw_empty = true,
                separator = { left = '', right = '' }
              }
            ''
          ];
          c = [
            ''
              {
                "filename",
                symbols = {modified = ' ', readonly = ' '},
              }
            ''
            ''
              {
                "diff",
                colored = false,
                diff_color = {
                  -- Same color values as the general color option can be used here.
                  added    = 'DiffAdd',    -- Changes the diff's added color
                  modified = 'DiffChange', -- Changes the diff's modified color
                  removed  = 'DiffDelete', -- Changes the diff's removed color you
                },
                symbols = {added = '[+]', modified = '[~]', removed = '[-]'}, -- Changes the diff symbols
              }
            ''
          ];
          x = [
            ''
              {
                "diagnostics",
                sources = {'nvim_lsp', 'nvim_diagnostic', 'nvim_diagnostic', 'vim_lsp', 'coc'},
                symbols = {error = '󰅙  ', warn = '  ', info = '  ', hint = '󰌵 '},
                colored = true,
                update_in_insert = false,
                always_visible = false,
                diagnostics_color = {
                  color_error = { fg = 'red' },
                  color_warn = { fg = 'yellow' },
                  color_info = { fg = 'cyan' },
                },
              }
            ''
            ''
              {
                -- Lsp server name
                function()
                  local buf_ft = vim.api.nvim_get_option_value('filetype', {})

                  -- List of buffer types to exclude
                  local excluded_buf_ft = {"toggleterm", "NvimTree", "TelescopePrompt"}

                  -- Check if the current buffer type is in the excluded list
                  for _, excluded_type in ipairs(excluded_buf_ft) do
                    if buf_ft == excluded_type then
                      return ""
                    end
                  end

                  -- Get the name of the LSP server active in the current buffer
                  local clients = vim.lsp.get_active_clients()
                  local msg = 'No Active Lsp'

                  -- if no lsp client is attached then return the msg
                  if next(clients) == nil then
                    return msg
                  end

                  for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                      return client.name
                    end
                  end

                  return msg
                end,
                icon = ' ',
              }
            ''
            ''
              {
                "fileformat",
                symbols = {
                  unix = '', -- e712
                  dos = '',  -- e70f
                  mac = '',  -- e711
                }
              }
            ''
            ''
              {
                "filetype",
                colored = true,
                icon_only = true,
                icon = { align = 'left' }
              }
            ''
          ];
          y = [
            ''
              {
                "",
                draw_empty = true,
                separator = { left = '', right = '' }
              }
            ''
            ''
              {
                'searchcount',
                maxcount = 999,
                timeout = 120,
                separator = {left = ''}
              }
            ''
            ''
              {
                "progress",
              }
            ''
          ];
          z = [
            ''
              {
                "",
                draw_empty = true,
                separator = { left = '', right = '' }
              }
            ''
            ''
              {"location"}
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
          # "prevent newly opened file from opening in the same window as the tree"
          actions.open_file.eject = false;

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
        enable = true;

        name = "rose-pine";
        style = "main";
      };

      visuals = {
        enable = true;

        # hmm...
        cellularAutomaton = {
          enable = true;

          # bind is "<leader>fml" for "fuck my life"
          mappings.makeItRain = "<leader>fml";
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
        indentBlankline.enable = true;
        # scollbar
        scrollBar.enable = true;
        smoothScroll.enable = true;
      };

      utility = {
        # NF icon picker
        icon-picker.enable = true;

        # markdown preview with glow
        preview.glow = {
          enable = true;
          # "<leader>p"
        };

        # images support
        images.image-nvim = {
          enable = true;

          setupOpts.integrations.markdown.downloadRemoteImages = true;
        };
      };
    };
  };
}
