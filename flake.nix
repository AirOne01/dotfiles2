{
  description = "r1's simple NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: {
    # main laptop
    nixosConfigurations = {
      cassiopeia = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";
        modules = [
          ./hosts/cassiopeia/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}
