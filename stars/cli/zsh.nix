_: {
  name = "zsh";

  config = {config, ...}: {
    programs.zsh.enable = true;

    home-manager.users.${config.stars.mainUser} = {
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
          # Uncomment and adjust if needed:
          # path = "${config.users.users.${config.stars.mainUser}.home}/.config/zsh/history";
        };
      };

      programs.oh-my-posh.enableZshIntegration = true;
    };
  };
}
