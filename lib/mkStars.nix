{
  lib,
  pkgs,
}: let
  starFiles = lib.filesystem.listFilesRecursive ../stars;
  stars = lib.listToAttrs (
    map
    (file: let
      name = lib.removeSuffix ".nix" (baseNameOf file);
      starModule = import file {inherit lib pkgs;};
    in {
      inherit name;
      value = {
        _module.args = {
          version = starModule.version or "0.0.0";
          environments = starModule.environments or [];
          systemConfigs = starModule.systemConfigs or {};
          systemPackages = starModule.systemPackages or [];
          packages = starModule.packages or [];
        };
        imports = [starModule.config or {}];
      };
    })
    (builtins.filter (file: lib.hasSuffix ".nix" file) starFiles)
  );
in
  stars
