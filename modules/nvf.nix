{ pkgs, ... }:

{
  #home.packages = with pkgs; [
  #  nvf
  #];

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
	  rust.enable = true;
	  nix.enable = true;
	  sql.enable = true;
	  clang.enable = true;
	  ts.enable = true;
	  python.enable = true;
	  #zig.enable = true;
	  markdown.enable = true;
	  html.enable = true;
	  #dart.enable = true;
	  go.enable = true;
	  lua.enable = true;
	  #php.enable = true;
	};
      };
    };
  };
}
