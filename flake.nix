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

    # for each linux x86_64 and aarch64
    eachSystem = nixpkgs.lib.genAttrs (import systems);

    # List of my NixOS configurations
    nixosConfigs = [
      # main laptop
      "cassiopeia"
      # work vm
      "orion"
    ];

    # List of my NixOS images
    nixosImages = [
      # live ISO image for debugging and stuff
      "ursamajor"
    ];
  in {
    # These are my mains setups (called constellations).
    nixosConfigurations = lib.genAttrs nixosConfigs (name:
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
    packages = eachSystem (system:
      lib.genAttrs nixosImages (name:
        nixos-generators.nixosGenerate {
          lib = extendedLib;
          inherit system;

          modules = [
            home-manager.nixosModules.default
            ./stars
            ./constellations/${name}
          ];

          format = "install-iso";
        }));
  };
}
