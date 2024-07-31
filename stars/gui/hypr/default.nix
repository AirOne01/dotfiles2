{
  lib,
  config,
  ...
}: let
  cfg = config.stars.gui.hypr;
in {
  options.stars.gui.hypr.enable = lib.mkEnableOption "Enable custom Hyprland config";

  config = lib.mkIf cfg.enable {
    programs.hyprland.enable = true;

    home-manager.users."r1".imports = [
      ./home
    ];
  };
}
