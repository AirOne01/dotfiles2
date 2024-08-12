_: {
  # with this ISO image is a bit bigger but compresses way faster
  isoImage.squashfsCompression = "gzip -Xcompression-level 1";

  # hostname
  networking.hostName = "ursamajor";
  stars.mainUserName = "nixos";

  stars = {
    iso.enable = true;
    gnome.enable = true;
    networkmanager.enable = true;
    plymouth.enable = true;
  };
}
