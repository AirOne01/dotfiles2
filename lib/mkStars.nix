{
  lib,
  pkgs,
}: let
  # Get all .nix files in the stars directory
  starFiles = lib.filesystem.listFilesRecursive ../stars;

  # Filter out any non-.nix files and create an attrset of star names to their modules
  stars = lib.listToAttrs (
    map
    (
      file: let
        name = lib.removeSuffix ".nix" (baseNameOf file);
      in {
        inherit name;
        value = import file {inherit pkgs;};
      }
    )
    (builtins.filter (file: lib.hasSuffix ".nix" file) starFiles)
  );
in
  stars
