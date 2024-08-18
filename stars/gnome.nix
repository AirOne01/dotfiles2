{pkgs, ...}: {
  version = "0.0.0";
  environments = ["nixos"];
  systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnome.dconf-editor
    gnome.adwaita-icon-theme
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
  ];

  config = {
    config,
    pkgs,
    ...
  }: {
    # Enable the GNOME Desktop Environment
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    # Enable sound
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Enable GNOME-specific services
    services.gnome = {
      gnome-keyring.enable = true;
      gnome-online-accounts.enable = true;
      gnome-settings-daemon.enable = true;
    };

    # Enable some GNOME Shell extensions by default
    services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
      [org.gnome.shell]
      enabled-extensions=['appindicatorsupport@rgcjonas.gmail.com', 'dash-to-dock@micxgx.gmail.com']

      [org.gnome.desktop.interface]
      enable-hot-corners=false

      [org.gnome.mutter]
      edge-tiling=true

      [org.gnome.desktop.wm.preferences]
      button-layout='appmenu:minimize,maximize,close'
    '';

    # Exclude some default GNOME apps
    environment.gnome.excludePackages = with pkgs.gnome; [
      epiphany # web browser
      totem # video player
      geary # email client
      gnome-music # music player
    ];

    # Enable Flatpak support (optional, but useful for GNOME users)
    services.flatpak.enable = true;

    # Add your user to necessary groups
    users.users.yourUsername = {
      extraGroups = ["networkmanager" "video"];
    };

    # Add system packages
    environment.systemPackages = config._module.args.systemPackages;
  };
}
