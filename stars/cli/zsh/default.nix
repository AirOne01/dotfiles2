{
  lib,
  config,
  ...
}: let
  zshStar = lib.mkStar {
    name = "zsh";

    extraConfig = {
      programs.zsh.enable = true;
    };

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
          #path = "${config.users.users.${config.stars.mainUserName}}/.config/zsh/history";
        };
      };

      programs.oh-my-posh.enableZshIntegration = true;
    };
  };
in {
  imports = [zshStar];
}
