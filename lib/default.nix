{lib}: let
  mkStar = _: {
    name,
    packages ? [],
    extraConfig ? {},
  }: {config, ...}: let
    cfg = config.stars.${name};
  in {
    options.stars.${name} = {
      enable = lib.mkEnableOption "Enable the ${name} star";

      packages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = packages;
        description = "System-wide packages to install";
      };
    };

    config = lib.mkIf cfg.enable (lib.mkMerge [
      {
        environment.systemPackages = cfg.packages;
      }
      extraConfig
    ]);
  };
in {
  # Extend the existing lib with the star builder
  extend = final: _: {
    mkStar = mkStar {inherit (final) pkgs;};
  };
}
