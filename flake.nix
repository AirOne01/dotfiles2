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
  };

  outputs = {
    nixpkgs,
    nixos-generators,
    home-manager,
    ...
  }: let
    # Extending lib by adding mkStar
    inherit (nixpkgs) lib;
    customLib = import ./lib {inherit lib;};
    extendedLib = lib.extend customLib.extend;

    system = "x86_64-linux";
  in {
    # These are my mains setups (called constellations).
    nixosConfigurations = {
      # main laptop
      cassiopeia = nixpkgs.lib.nixosSystem {
        lib = extendedLib;
        inherit system;

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
        inherit system;

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
    packages = {
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
    };
  };
}
