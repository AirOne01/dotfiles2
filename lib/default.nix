{lib}: let
  mkStar = _: {
    name,
    packages ? [],
    systemPackages ? [],
    extraConfig ? {},
    extraHomeConfig ? {},
  }: {config, ...}: let
    cfg = config.stars.${name};
  in {
    options.stars.${name} = {
      enable = lib.mkEnableOption "Enable the ${name} star";
    };

    config = lib.mkIf cfg.enable (lib.mkMerge [
      {
        environment.systemPackages = systemPackages;
        home-manager.users.${config.stars.mainUserName}.home.packages = packages;
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
