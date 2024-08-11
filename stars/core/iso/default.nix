{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: let
  isoStar = lib.mkStar {
    name = "iso";
    #packages = with pkgs; [btop];
    extraConfig = lib.mkMerge [
      {
        # Some NixOS configs
        nixpkgs.config.allowUnfree = lib.mkDefault true;
        nix.settings.experimental-features = lib.mkDefault ["nix-command" "flakes"];

        # HM config
        home-manager = {
          #enable = true;
          extraSpecialArgs = {inherit inputs;};
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
          users.nixos.home = {
            username = "nixos";
            homeDirectory = "/home/nixos";
            # Don't change this
            stateVersion = "24.05";
          };
        };
      }
      (lib.mkIf config.stars.gnome.enable {
        # GDM auto login
        services.displayManager.autoLogin = {
          enable = true;
          user = "nixos";
        };
      })
    ];
  };
in {
  imports = [isoStar];
}
