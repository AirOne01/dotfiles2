{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    btop
  ];

  # btop config
  programs.btop = {
    enable = true;

    settings = {
      color_theme = "horizon";
      update_ms = 200;
    };
  };
}
