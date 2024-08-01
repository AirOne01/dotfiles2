{
  lib,
  config,
  ...
}: let
  cfg = config.stars.core.fr;
in {
  options.stars.core.fr.enable = lib.mkEnableOption "French language star";

  config = lib.mkIf cfg.enable {
    console.keyMap = "fr";
  };

  # TODO: Add nvf spellchecker dictionary here
}
