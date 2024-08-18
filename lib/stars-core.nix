{
  lib,
  config,
  ...
}: {
  options.stars = {
    mainUser = lib.mkOption {
      type = lib.types.str;
      description = "Name of the user that home-manager will configure and will have packages install to";
    };
  };

  config = {
    users.users.${config.stars.mainUser} = {
      # UID > 1000
      isNormalUser = true;
      # gives sudo perms
      extraGroups = ["wheel"];
      # ... other user settings
    };

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.${config.stars.mainUser} = {
        # Add home-manager configurations for the main user here
        home = {
          username = config.stars.mainUser;
          homeDirectory = "/home/${config.stars.mainUser}";

          # This is dangerous but fuck it
          inherit (config.system) stateVersion;
        };
      };
    };
  };
}
