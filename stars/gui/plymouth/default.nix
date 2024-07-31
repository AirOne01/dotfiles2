{lib, ...}: {
  imports = [
    ./nixos
  ];

  options.stars.gui.plymouth.enable = lib.mkEnableOption "Enable Plymouth and its custom config";
}
