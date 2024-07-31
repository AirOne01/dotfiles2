{
  lib,
  config,
  ...
}: let
  cfg = config.stars.code.garnix;
in {
  options.stars.code.garnix.enable = lib.mkEnableOption "Garnix CI star";

  config = lib.mkIf cfg.enable {
    nix.settings = {
      substituters = ["https://cache.garnix.io"];
      trusted-public-keys = ["cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="];
    };
  };
}
