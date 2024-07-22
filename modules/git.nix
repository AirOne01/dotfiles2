{pkgs, ...}: {
  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;

    userName = "AirOne01";
    userEmail = "21955960+AirOne01@users.noreply.github.com";
  };
}
