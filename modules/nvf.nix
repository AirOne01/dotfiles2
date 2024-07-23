{pkgs, ...}: {
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
          nix.enable = true;
          html.enable = true;
          ts.enable = true;
        };

	      #startPlugins = [
	      #  pkgs.vimPlugins.telescope-nvim
	      #];

	      statusline.lualine = {
	        enable = true;
	      };

        telescope = {
          enable = true;
        };

        theme = {
          name = "tokyonight";
          style = "darker";
        };
      };
    };
  };
}
