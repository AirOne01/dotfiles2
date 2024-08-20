{stars, ...}: {
  # hostname
  networking.hostName = "cassiopeia";

  imports = with stars; [
    gnome
    dev-rust
  ];

  stars.mainUser = "r1";

  system.stateVersion = "24.05";

  # hardware configs
  hardware = {
    # opengl
    graphics.enable = true;

    # for most advanced wayland compositors
    nvidia.modesetting.enable = true;
  };
}
