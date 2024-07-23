{
  description = "r1's simple NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: {
    nixosConfigurations = {
      # main laptop
      cassiopeia = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";
        modules = [
          ./hosts/cassiopeia/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      orion = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";
        modules = [
          ./hosts/orion/configuration.nix
          inputs.home-manager.nixosModules.default
          inputs.nvf.nixosModules.default
          ./modules/nvf.nix
        ];
      };
    };
  };
}
