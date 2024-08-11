{pkgs, ...}: {
  home.packages = with pkgs; [
    oh-my-posh
  ];

  programs.oh-my-posh = {
    enable = true;

    enableZshIntegration = true;
    useTheme = "M365Princess";
  };
}
