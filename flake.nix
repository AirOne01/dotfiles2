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
          inherit ((mkStars nixpkgs.legacyPackages.${system})) stars;
        };
        inherit system format;

        modules = [
          (import ./lib/stars-core.nix)
          home-manager.nixosModules.default
          ./constellations/${hostName}
        ];
      };

    # Generate packages for all combinations
    mkPackages = system:
      combineArrays outImages outFormats (
        hostName: format:
          mkNixosConfiguration system format hostName
      );

    # Function to create a devShell from a list of stars
    mkDevShell = system: starNames: let
      pkgs = nixpkgs.legacyPackages.${system};
      starsLib = mkStars pkgs;
      systemPackages = lib.concatMap (name: starsLib.stars.${name}.environment.systemPackages) starNames;
    in
      pkgs.mkShell {
        buildInputs = systemPackages;
        shellHook = ''
          echo "Development environment loaded with packages from stars: ${toString starNames}"
        '';
      };
  in {
    # NixOS configurations
    nixosConfigurations = lib.genAttrs outConfigs (name:
      nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit ((mkStars nixpkgs.legacyPackages.x86_64-linux)) stars;
        };
        system = "x86_64-linux";

        modules = [
          (import ./lib/stars-core.nix)
          home-manager.nixosModules.home-manager
          ./constellations/${name}/hardware-configuration.nix
          ./constellations/${name}/configuration.nix
        ];
      });

    # Packages, including temporary setups (ISO images)
    packages = eachSystem (system: mkPackages system);

    # DevShells
    devShells = eachSystem (system: {
      rust = mkDevShell system ["dev-rust"];
    });
  };
}
