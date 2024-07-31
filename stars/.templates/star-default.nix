{
  lib,
  config,
  ...
}: let
  cfg = config.stars.X.Y;
in {
  options.stars.X.Y.enable = lib.mkEnableOption "Y star";

  config = lib.mkIf cfg.enable {
    home-manager.users.r1.imports = [
      ./home
    ];
  };
}
