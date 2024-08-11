{
  description = "r1's increasignly-less-simple NixOS config";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # for linux x86_64 and aarch64
    systems.url = "github:nix-systems/default-linux";
  };

  outputs = {
    home-manager,
    nixpkgs,
    nixos-generators,
    systems,
    ...
  }: let
    # Extending lib by adding mkStar
    inherit (nixpkgs) lib;
    customLib = import ./lib {inherit lib;};
    extendedLib = lib.extend customLib.extend;

    eachSystem = nixpkgs.lib.genAttrs (import systems);
  in {
    # These are my mains setups (called constellations).
    nixosConfigurations = {
      # main laptop
      cassiopeia = nixpkgs.lib.nixosSystem {
        lib = extendedLib;
        system = "x86_64-linux";

        modules = [
          ./constellations/cassiopeia/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.r1 = import ./constellations/cassiopeia/home.nix;
          }
        ];
      };
      # work vm
      orion = nixpkgs.lib.nixosSystem {
        lib = extendedLib;
        system = "x86_64-linux";

        modules = [
          ./constellations/orion/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.r1 = import ./constellations/orion/home.nix;
          }
        ];
      };
    };

    # And those are my more temporary setups.
    # This is the place where I define
    # my on-the-go ISO images, like Ursa Major.
    packages = eachSystem (system: {
      # live ISO image for debugging and stuff
      ursa-major = nixos-generators.nixosGenerate {
        lib = extendedLib;
        inherit system;

        modules = [
          ./constellations/ursamajor
          home-manager.nixosModules.default
        ];
        format = "install-iso";
      };
    });
  };
}
