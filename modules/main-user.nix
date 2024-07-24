# main-user.nix
{
  lib,
  config,
  ...
}: let
  cfg = config.main-user;
in {
  options.main-user = {
    enable =
      lib.mkEnableOption "enable user module";

    userName = lib.mkOption {
      default = "mainuser";
      description = ''
        username
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      initialPassword = "password1234";
      description = "main user";
      extraGroups = ["networkmanager" "wheel"];
    };
  };
}
