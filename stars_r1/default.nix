{
  lib,
  pkgs,
  config,
  ...
}: let
  r1Star = lib.mkStar {
    name = "r1";

    extraConfig = {
      # time zone
      time.timeZone = "Europe/Paris";

      # internationalisation properties
      i18n.defaultLocale = "en_US.UTF-8";
      i18n.extraLocaleSettings = {
        LC_ADDRESS = "fr_FR.UTF-8";
        LC_IDENTIFICATION = "fr_FR.UTF-8";
        LC_MEASUREMENT = "fr_FR.UTF-8";
        LC_MONETARY = "fr_FR.UTF-8";
        LC_NAME = "fr_FR.UTF-8";
        LC_NUMERIC = "fr_FR.UTF-8";
        LC_PAPER = "fr_FR.UTF-8";
        LC_TELEPHONE = "fr_FR.UTF-8";
        LC_TIME = "fr_FR.UTF-8";
      };

      # fonts
      fonts.packages = with pkgs; [
        (nerdfonts.override {fonts = ["JetBrainsMono"];})
        noto-fonts-emoji
      ];

      # default shell
      users.users.${config.stars.mainUserName}.shell = lib.mkIf config.stars.zsh.enable pkgs.zsh;
    };
  };
in {
  imports = [r1Star ./git];
}
