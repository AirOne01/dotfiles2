{
  system,
  nixpkgs,
  ...
}: let
  pkgs = nixpkgs.legacyPackages.${system};

  commitlintDeps = pkgs.mkYarnPackage {
    name = "commitlint-deps";
    src = pkgs.writeTextFile {
      name = "package.json";
      text = builtins.toJSON {
        name = "commitlint-config";
        version = "1.0.0";
        license = "MIT";
        dependencies = {
          "@commitlint/cli" = "^19.5.0";
          "@commitlint/config-conventional" = "^19.5.0";
        };
      };
    };
    packageJSON = ./package.json;
    yarnLock = ./yarn.lock;
  };
in
  pkgs.mkShell {
    buildInputs = with pkgs; [
      commitlint
    ];

    shellHook = ''
      export COMMITLINT_CONFIG=".commitlintrc.yml"
    '';
  }
