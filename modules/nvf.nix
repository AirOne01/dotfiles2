{pkgs, ...}: {
  home.packages = with pkgs; [
    # for lightbulb emoji
    noto-fonts-color-emoji
    # image display backend
    ueberzug
  ];

  imports = [
    ./nvf/binds.nix
    ./nvf/filetree.nix
    ./nvf/lsp.nix
    ./nvf/statusline.nix
    ./nvf/tabline.nix
    ./nvf/telescope.nix
    ./nvf/treesitter.nix
    ./nvf/ui.nix
    ./nvf/utility.nix
    ./nvf/vim.nix
  ];

  programs.nvf = {
    enable = true;
  };
}
