# https://nixoswiki/wiki/GNOME
{pkgs, ...}: {
  # gnome plugins
  home.packages = with pkgs.gnomeExtensions; [
    # subtray icons
    appindicator
  ];

  dconf = {
    enable = true;

    settings = {
      # dark mode
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";

      "org/gnome/shell" = {
        disable-user-extensions = false;
        enable-extensions = with pkgs.gnomeExtensions; [
          blur-my-shell.extensionUuid
          gsconnect.extensionUuid
        ];
      };
    };
  };
}
