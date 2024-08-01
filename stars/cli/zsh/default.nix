{
  lib,
  config,
  ...
}: let
  cfg = config.stars.cli.zsh;
in {
  options.stars.cli.zsh.enable = lib.mkEnableOption "zsh star";

  config = lib.mkIf cfg.enable {
    home-manager.users.r1.imports = [
      ./home
    ];
  };
}
