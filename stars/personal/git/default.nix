{
  lib,
  config,
  ...
}: let
  cfg = config.stars.personal.git;
in {
  options.stars.personal.git.enable = lib.mkEnableOption "Git and GitHub star";

  config = lib.mkIf cfg.enable {
    home-manager.users.r1.imports = [
      ./home
    ];
  };
}
