{lib, ...}: let
  btopStar = lib.mkStar {
    name = "btop";

    extraHomeConfig = {
      programs.btop = {
        enable = true;

        settings = {
          color_theme = "horizon";
          update_ms = 200;
        };
      };
    };
  };
in {
  imports = [btopStar];
}
