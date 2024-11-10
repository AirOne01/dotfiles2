{
  system,
  nixpkgs,
  ...
}: let
  pkgs = nixpkgs.legacyPackages.${system};

  packages = with pkgs; [
    commitlint-rs
  ];
in
  pkgs.mkShell {
    buildInputs = packages;
  }
