{
  inputs,
  lib,
  config,
  ...
}: let
  cfg = config.stars.personal.nvim;
in {
  options.stars.personal.nvim.enable = lib.mkEnableOption "Enable custom NeoVim config";

  config = lib.mkIf cfg.enable {
    home-manager.users.r1.imports = [
      inputs.nvf.homeManagerModules.default
      ./home
    ];
  };
}
