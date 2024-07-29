{
  pkgs,
  lib,
  config,
  ...
}: let
  # not `config.stars.personal` as we need userName
  cfg = config.stars;
in {
  imports = [
    ./nvim/default.nix
    #./secrets/default.nix
    #./vscode/default.nix
  ];

  options.stars.personal = {
    enable = lib.mkEnableOption "Enable personal configurations";

    #secrets.enable = lib.mkEnableOption "Enable personal secrets";
    #vscode.enable = lib.mkEnableOption "Enable custom VSCode OSS config";
  };

  config = lib.mkIf (cfg.personal.enable
    && (cfg.userName
      == "r1")) {
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

    # x11 keymap
    services.xserver = {
      xkb = {
        layout = "fr";
        variant = "";
      };
    };

    # fonts
    fonts.packages = with pkgs; [
      (nerdfonts.override {fonts = ["JetBrainsMono"];})
      noto-fonts-emoji
    ];
  };
}
