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
    ./fr.nix
    ./sound.nix
  ];

  config = lib.mkIf cfg.enable {
    # unfree software
    nixpkgs.config.allowUnfree = true;

    # console
    console = {
      keyMap = "us";
      font = "ter-v16b";
      packages = with pkgs; [terminus_font];
    };

    # flakes
    nix.settings.experimental-features = ["nix-command" "flakes"];

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
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
      extraSpecialArgs = {inherit inputs;};
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
    };
  };
}
