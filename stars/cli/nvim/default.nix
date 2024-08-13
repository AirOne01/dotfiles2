{
  lib,
  inputs,
  ...
}: let
  nvimStar = lib.mkStar {
    name = "nvim";

    extraHomeConfig.imports = [
      inputs.nvf.homeManagerModules.default
      ./home
    ];
  };
in {
  imports = [nvimStar];
}
