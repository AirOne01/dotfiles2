{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.stars.gui.gnome;
in {
  options.stars.gui.gnome.enable = lib.mkEnableOption "Enable custom Gnome config";

  config = lib.mkIf cfg.enable {
    home-manager.users."r1".imports = [
      ./home/default.nix
    ];

    services = {
      # gnome-settings-daemon udev rules
      udev.packages = with pkgs; [gnome.gnome-settings-daemon];

      # enable gnome and gdm
      xserver = {
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
      };
    };

    # overlays
    nixpkgs.overlays = [
      (_: prev: {
        gnome = prev.gnome.overrideScope (_: gnomePrev: {
          mutter = gnomePrev.mutter.overrideAttrs (_: {
            src = pkgs.fetchFromGitLab {
              domain = "gitlab.gnome.org";
              owner = "vanvugt";
              repo = "mutter";
              rev = "triple-buffering-v4-46";
              hash = "sha256-nz1Enw1NjxLEF3JUG0qknJgf4328W/VvdMjJmoOEMYs=";
            };
          });
        });
      })
    ];

    environment.gnome.excludePackages =
      (with pkgs; [
        gnome-photos
        gnome-tour
        gedit # text editor
      ])
      ++ (with pkgs.gnome; [
        cheese
        gnome-music
        evince # document viewer
        gnome-characters
        totem # video video player
      ]);
  };
}
