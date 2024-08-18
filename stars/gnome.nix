{pkgs, ...}: {
  # GNOME-specific configuration
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # GNOME-specific packages
  environment.systemPackages = with pkgs; [
    gnome.gnome-tweaks
    gnome.dconf-editor
    # Add other GNOME-related packages here
  ];

  # Other GNOME-related configurations
  # ...
}
