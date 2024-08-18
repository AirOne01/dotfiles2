{
  pkgs,
  lib,
  ...
}: let
  pythonStar = lib.mkStar {
    name = "dev-python";
    packages = with pkgs; [
      pipx
      poetry
      python312
      python312Packages.pip
      python312Packages.virtualenv
    ];
  };
in {
  imports = [pythonStar];
}
