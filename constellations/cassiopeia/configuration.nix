_: {
  # bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # hostname
  networking.hostName = "cassiopeia";
  stars.mainUserName = "r1";

  # hardware configs
  hardware = {
    # opengl
    graphics.enable = true;

    # for most advanced wayland compositors
    nvidia.modesetting.enable = true;
  };
}
