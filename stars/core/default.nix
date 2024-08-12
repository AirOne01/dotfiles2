{
  lib,
  inputs,
  config,
  ...
}: let
  inherit (config.stars) mainUserName;
in {
  imports = [./iso ./pipewire];

  options.stars = {
    mainUserName = lib.mkOption {
      type = lib.types.str;
      description = "Name of the user that home-manager will configure and will have packages install to";
    };
  };

  config = {
    # unfree software
    nixpkgs.config.allowUnfree = lib.mkDefault true;

    # flakes
    nix.settings.experimental-features = lib.mkDefault ["nix-command" "flakes"];

    # setup user
    users.users.${mainUserName}.isNormalUser = true;

    # If you change this you will
    # be cursed by the gods of open source
    system.stateVersion = "24.05";

    # home-manager
    home-manager = {
      # pass inputs to home-manager modules
      extraSpecialArgs = lib.mkDefault {inherit inputs;};
      useGlobalPkgs = lib.mkDefault true;
      useUserPackages = lib.mkDefault true;
      backupFileExtension = lib.mkDefault "backup";

      users.${mainUserName} = {
        # Starry should replace home.nix here \/
        #imports = [../../constellations/${config.networking.hostName}/home.nix];

        home = {
          username = mainUserName;
          homeDirectory = "/home/${mainUserName}";

          # If you change this you will
          # be cursed by the gods of open source
          stateVersion = "24.05";
        };
      };
    };
  };
}
