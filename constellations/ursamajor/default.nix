_: {
  imports = [../../stars];

  # with this ISO image is a bit bigger but compresses way faster
  isoImage.squashfsCompression = "gzip -Xcompression-level 1";

  stars = {
    iso.enable = true;
    gnome.enable = true;
    networkmanager.enable = true;
    plymouth.enable = true;
  };

  # If you change this you will
  # be cursed by the gods of open source
  system.stateVersion = "24.05";
}
