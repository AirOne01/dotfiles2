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
    # unfree software
    nixpkgs.config.allowUnfree = lib.mkDefault true;

    # console
    console = {
      keyMap = lib.mkDefault "us";
      font = lib.mkDefault "ter-v16b";
      packages = with pkgs; [terminus_font];
    };

    # Network Manager
    networking.networkmanager.enable = true;

    # flakes
    nix.settings.experimental-features = lib.mkDefault ["nix-command" "flakes"];

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

    # home-manager
    home-manager = {
      # pass inputs to home-manager modules
      extraSpecialArgs = lib.mkDefault {inherit inputs;};
      useGlobalPkgs = lib.mkDefault true;
      useUserPackages = lib.mkDefault true;
      backupFileExtension = lib.mkDefault "backup";
    };
  };
}
