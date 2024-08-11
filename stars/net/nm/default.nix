{lib, ...}: let
  nmStar = lib.mkStar {
    name = "networkmanager";
    extraConfig = {
      networking = {
        # gotta be explicit here
        wireless = {
          enable = false;
          iwd = {
            enable = true;
            settings = {
              Settings.AutoConnect = true;
            };
          };
        };
        networkmanager = {
          enable = true;
          # iwd as a backend for NM
          wifi.backend = "iwd";
        };
      };
    };
  };
in {
  imports = [nmStar];
}
