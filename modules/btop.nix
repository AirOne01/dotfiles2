{pkgs, ...}: {
  home.packages = with pkgs; [
    btop
  ];

  programs.btop = {
    enable = true;

    settings = {
      color_theme = "horizon";
      update_ms = 200;
    };
  };
}
