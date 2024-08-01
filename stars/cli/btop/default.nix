{
  lib,
  config,
  ...
}: let
  cfg = config.stars.cli.btop;
in {
  options.stars.cli.btop.enable = lib.mkEnableOption "btop++ star";

  config = lib.mkIf cfg.enable {
    home-manager.users.r1.imports = [
      ./home
    ];
  };
}
