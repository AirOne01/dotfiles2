{
  description = "r1's increasingly-less-simple NixOS config";

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

    systems.url = "github:nix-systems/default-linux";
  };

  outputs = {
    home-manager,
    nixpkgs,
    nixos-generators,
    systems,
    ...
  } @ inputs: let
    inherit (nixpkgs) lib;
    eachSystem = f: lib.genAttrs (import systems) (system: f system);

    mkStars = pkgs:
      import ./lib/mkStars.nix {
        inherit lib pkgs;
        userName = "r1";
      };

    # List of my NixOS configurations
    outConfigs = ["cassiopeia" "orion"];

    # List of my NixOS images
    outImages = ["ursamajor"];

    # List of formats i want to compile my images to
    outFormats = ["install-iso" "iso"];

    # combineArrays function
    combineArrays = arr1: arr2: f:
      builtins.listToAttrs (builtins.concatMap
        (x:
          map (y: {
            name = "${x}-${y}";
            value = f x y;
          })
          arr2)
        arr1);

    # Function to generate a single NixOS configuration
    mkNixosConfiguration = system: format: hostName:
      nixos-generators.nixosGenerate {
        specialArgs = {
          inherit inputs;
        };
        inherit system format;

        modules = [
          home-manager.nixosModules.default
          inputs.nvf.homeManagerModules.default
          (import ./lib/stars-core.nix)
          ./constellations/${hostName}
          ({
            config,
            pkgs,
            ...
          }: {
            _module.args.stars =
              (mkStars {
                inherit lib pkgs;
                inherit (config.stars) mainUser;
              })
              .stars;
          })
        ];
      };

    # Generate packages for all combinations
    mkPackages = system:
      combineArrays outImages outFormats (
        hostName: format:
          mkNixosConfiguration system format hostName
      );
  in {
    # NixOS configurations
    nixosConfigurations = lib.genAttrs outConfigs (name: let
      system = "x86_64-linux";
    in
      nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit ((mkStars nixpkgs.legacyPackages.${system})) stars;
        };
        inherit system;

        modules = [
          home-manager.nixosModules.home-manager
          # inputs.nvf.homeManagerModules.default
          (import ./lib/stars-core.nix)
          ./constellations/${name}/hardware-configuration.nix
          ./constellations/${name}/configuration.nix
        ];
      });

    # Packages, including temporary setups (ISO images)
    packages = eachSystem (system: mkPackages system);
  };
}
