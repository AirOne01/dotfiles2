{lib, ...}: let
  ompStar = lib.mkStar {
    name = "oh-my-posh";

    extraHomeConfig = {
      programs.oh-my-posh = {
        enable = true;

        useTheme = "M365Princess";
      };
    };
  };
in {
  imports = [ompStar];
}
