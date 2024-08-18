{
  lib,
  pkgs,
}: let
  # Recursively get all .nix files and directories from the stars directory
  allItems = lib.filesystem.listFilesRecursive ../stars;

  # Function to check if a path is a directory with a default.nix file
  isDefaultNixDir = path:
    (builtins.pathExists (path + "/default.nix")) && (builtins.readDir path).default-nix == "regular";

  # Filter to include .nix files and directories with default.nix
  validItems =
    builtins.filter (
      item:
        lib.hasSuffix ".nix" item || isDefaultNixDir item
    )
    allItems;

  # Function to get the appropriate path for importing
  getImportPath = item:
    if isDefaultNixDir item
    then item + "/default.nix"
    else item;

  stars = lib.listToAttrs (
    map
    (item: let
      # Extract the relative path from the stars directory
      relPath = lib.removePrefix "${toString ../stars}/" (toString item);
      # Use the relative path (without .nix) as the name, replacing / with -
      name = lib.removeSuffix ".nix" (builtins.replaceStrings ["/"] ["-"] relPath);
      # Remove "default" from the end of the name if it's a default.nix file
      finalName =
        if lib.hasSuffix "-default" name
        then lib.removeSuffix "-default" name
        else name;
      starModule = import (getImportPath item) {inherit lib pkgs;};
    in {
      name = finalName;
      value = {config, ...}: {
        _module.args = {
          version = starModule.version or "0.0.0";
          environments = starModule.environments or [];
          systemConfigs = starModule.systemConfigs or {};
          systemPackages = starModule.systemPackages or [];
          packages = starModule.packages or [];
        };
        imports = [
          (args: starModule.config (args // {inherit config;}))
        ];
      };
    })
    validItems
  );
in
  stars

