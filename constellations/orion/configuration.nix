{pkgs, ...}: {
  # Use the GRUB 2 boot loader.
  boot.loader.grub = {
    enable = true;

    device = "/dev/sda";
    useOSProber = true;
  };

  # VMWare tools
  virtualisation.vmware.guest.enable = true;

  # hostname
  networking.hostName = "orion";
  stars.mainUserName = "r1";

  # hardware configs
  hardware = {
    # opengl
    graphics.enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # networking
    wget
    curl
    nmap

    # versioning
    git
    gh # we need it system-wide for git to work
    # shells
    bash
  ];
}
