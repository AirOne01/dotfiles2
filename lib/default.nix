{lib}: let
  mkStar = _: {
    name,
    packages ? [],
    extraConfig ? {},
    extraHomeConfig ? {},
  }: {config, ...}: let
    cfg = config.stars.${name};
  in {
    options.stars.${name} = {
      enable = lib.mkEnableOption "Enable the ${name} star";

      packages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = packages;
        description = "User packages to install";
      };

      systemPackages = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = packages;
        description = "System-wide packages to install";
      };
    };

    config = lib.mkIf cfg.enable (lib.mkMerge [
      {
        environment.systemPackages = cfg.systemPackages;
        home-manager.users.${config.stars.mainUserName}.home.packages = cfg.packages;
      }
      {
        home-manager.users.${config.stars.mainUserName} = extraHomeConfig;
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
