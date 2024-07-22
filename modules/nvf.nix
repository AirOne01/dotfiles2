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
          nix.enable = true;
          html.enable = true;
          ts.enable = true;
        };
      };
    };
  };
}
