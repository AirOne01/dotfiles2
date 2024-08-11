{
  lib,
  inputs,
  pkgs,
  config,
  ...
}: let
  cfg = config.stars;
in {
  imports = [
    # home-manager
    inputs.home-manager.nixosModules.default

    # core stars
    ./fr
    ./sound
  ];

  config = lib.mkIf cfg.enable {
    # console
    console = {
      keyMap = lib.mkDefault "us";
      font = lib.mkDefault "ter-v16b";
      packages = with pkgs; [terminus_font];
    };

    # Network Manager
    networking.networkmanager.enable = true;
    networking.wireless.enable = false;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs;
      lib.mkDefault [
        # networking
        wget
        curl

        # versioning
        git

        # shells
        bash

        # text editor
        nano
      ];
  };
}
