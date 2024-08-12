_: {
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
