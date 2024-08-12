{lib, ...}: let
  pipewireStar = lib.mkStar {
    name = "pipewire";

    extraConfig = {
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
      };
      # this is required to be explicitly set to false
      hardware.pulseaudio.enable = false;
    };
  };
in {
  imports = [pipewireStar];
}
