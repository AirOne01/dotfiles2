{lib, ...}: {
  imports = [
    ./nixos/default.nix
  ];

  options.stars.gui.plymouth.enable = lib.mkEnableOption "Enable Plymouth and its custom config";
}
