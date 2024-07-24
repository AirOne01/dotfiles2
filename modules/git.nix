{pkgs, ...}: {
  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;

    userName = "AirOne01";
    userEmail = "21955960+AirOne01@users.noreply.github.com";

    aliases = {
      c = "checkout";
      cc = "commit";
      l = "log --all --graph --oneline";
      p = "pull";
      pp = "push";
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
      hosts = ["https://github.com" "https://gist.github.com"];
    };
  };
}
