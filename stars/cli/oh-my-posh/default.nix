{
  lib,
  config,
  ...
}: let
  cfg = config.stars.cli.oh-my-posh;
in {
  options.stars.cli.oh-my-posh.enable = lib.mkEnableOption "oh-my-posh star";

  config = lib.mkIf cfg.enable {
    home-manager.users.r1.imports = [
      ./home
    ];
  };
}
