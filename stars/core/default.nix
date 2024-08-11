{
  lib,
  inputs,
  ...
}: {
  imports = [./iso];

  config = {
    # unfree software
    nixpkgs.config.allowUnfree = lib.mkDefault true;

    # flakes
    nix.settings.experimental-features = lib.mkDefault ["nix-command" "flakes"];

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
