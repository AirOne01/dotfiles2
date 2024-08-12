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

    eachSystem = f: lib.genAttrs (import systems) (system: f system);

    # List of my NixOS configurations
    outConfigs = [
      # main laptop
      "cassiopeia"
      # work vm
      "orion"
    ];

    # List of my NixOS images
    outImages = [
      # live ISO image for debugging and stuff
      "ursamajor"
    ];

    # List of formats i want to compile my images to
    outFormats = [
      "install-iso"
      "iso"
      "virtualbox"
      "vmware"
    ];

    # combineArrays function
    combineArrays = arr1: arr2: f:
      builtins.listToAttrs (builtins.concatMap
        (x:
          map
          (y: {
            name = "${x}-${y}";
            value = f x y;
          })
          arr2)
        arr1);

    # Function to generate a single NixOS configuration
    mkNixosConfiguration = system: format: hostName:
      nixos-generators.nixosGenerate {
        inherit system format;
        lib = extendedLib;

        modules = [
          home-manager.nixosModules.default
          ./stars
          ./constellations/${hostName}
        ];
      };

    # Generate packages for all combinations
    mkPackages = system:
      combineArrays outImages outFormats (
        hostName: format:
          mkNixosConfiguration system format hostName
      );
  in {
    # These are my mains setups (called constellations).
    nixosConfigurations = lib.genAttrs outConfigs (name:
      nixpkgs.lib.nixosSystem {
        lib = extendedLib;
        system = "x86_64-linux";

        modules = [
          home-manager.nixosModules.home-manager
          ./stars
          ./constellations/${name}/hardware-configuration.nix
          ./constellations/${name}/configuration.nix
        ];
      });

    # And those are my more temporary setups.
    # This is the place where I define
    # my on-the-go ISO images, like Ursa Major.
    packages = eachSystem (system: mkPackages system);
  };
}
