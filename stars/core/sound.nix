{
  lib,
  config,
  ...
}: let
  cfg = config.stars.core.sound;
in {
  options.stars.core.sound.enable = lib.mkEnableOption "Sound star";
  options.stars.core.sound.engine = lib.mkOption {
    description = "Engine to use for sound";
    type = lib.types.str;
    default = "pipewire";
    example = "pipewire";
  };

  config = lib.mkIf (cfg.enable && (cfg.engine == "pipewire")) {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
