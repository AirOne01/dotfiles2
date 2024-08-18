{stars, ...}: {
  # hostname
  networking.hostName = "cassiopeia";
  #stars.mainUserName = "r1";

  imports = with stars; [
    gnome
  ];

  system.stateVersion = "24.05";

  # hardware configs
  hardware = {
    # opengl
    graphics.enable = true;

    # for most advanced wayland compositors
    nvidia.modesetting.enable = true;
  };
}
