{pkgs, ...}: {
  systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnome.dconf-editor
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock # Apple-style dock
    gnomeExtensions.appindicator # subtray icons
    gnomeExtensions.blur-my-shell # blurs your shell
    gnomeExtensions.gsconnect # KDE connect on GNOME
    # themes
    flat-remix-gtk
    kora-icon-theme
    # additional software
    themechanger
  ];

  config = {config, ...}: {
    security.rtkit.enable = true;

    # Exclude some default GNOME apps
    environment.gnome.excludePackages = with pkgs.gnome; [
      epiphany # web browser
      totem # video player
      geary # email client
      gnome-music # music player
    ];

    home-manager.users.${config.stars.mainUser} = {
      programs.gnome-shell = {
        enable = true;

        extensions = with pkgs.gnomeExtensions; [
          blur-my-shell.extensionUuid
          gsconnect.extensionUuid
          dock-from-dash.extensionUuid
          user-themes.extensionUuid
        ];
      };

      # GTK themes
      gtk = {
        enable = true;

        theme = {
          package = pkgs.flat-remix-gtk;
          name = "Flat Remix GTK Light";
        };
        iconTheme = {
          package = pkgs.kora-icon-theme;
          name = "Kora";
        };
      };
    };

    # Add your user to necessary groups
    users.users.${config.stars.mainUser} = {
      extraGroups = ["networkmanager" "video"];
    };

    services = {
      # Enable the GNOME Desktop Environment
      xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
      };

      # UDEV rules
      udev.packages = with pkgs; [gnome.gnome-settings-daemon];
      # Patch for GNOME2 applications
      dbus.packages = with pkgs; [gnome2.GConf];

      # Enable GNOME-specific services
      gnome = {
        gnome-keyring.enable = true;
        gnome-online-accounts.enable = true;
        gnome-settings-daemon.enable = true;
      };

      # Enable Flatpak support (optional, but useful for GNOME users)
      flatpak.enable = true;
    };
  };
}
