{
  lib,
  config,
  ...
}: let
  isoStar = lib.mkStar {
    name = "iso";

    extraConfig = lib.mkMerge [
      {
        # Some NixOS configs
        nixpkgs.config.allowUnfree = lib.mkDefault true;
        nix.settings.experimental-features = lib.mkDefault ["nix-command" "flakes"];
      }
      (lib.mkIf config.stars.gnome.enable {
        # GDM auto login
        services.displayManager.autoLogin = {
          enable = true;
          user = config.stars.mainUserName;
        };
      })
    ];
  };
in {
  imports = [isoStar];
}
