{
  lib,
  config,
  ...
}: let
  inherit (config.xdg) dataHome;

  zshStar = lib.mkStar {
    name = "zsh";

    extraHomeConfig = {
      programs.zsh = {
        enable = true;

        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
          l = "eza -laag --git --icons";
          zz = "zellij -l compact";
        };

        history = {
          size = 10000;
          path = "${dataHome}/zsh/history";
        };
      };

      programs.oh-my-posh.enableZshIntegration = true;
    };
  };
in {
  imports = [zshStar];
}
