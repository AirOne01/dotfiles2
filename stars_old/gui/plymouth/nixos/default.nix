{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.stars.gui.plymouth;
in {
  boot.plymouth = lib.mkIf cfg.enable {
    enable = true;

    themePackages = with pkgs; [
      (catppuccin-plymouth.override {variant = "mocha";})
    ];
    theme = "catppuccin-mocha";
  };
}
