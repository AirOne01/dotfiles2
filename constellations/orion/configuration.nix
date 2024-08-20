{pkgs, ...}: {
  # Use the GRUB 2 boot loader.
  boot.loader.grub = {
    enable = true;

    device = "/dev/sda";
    useOSProber = true;
  };

  system.stateVersion = "24.05";

  # VMWare tools
  virtualisation.vmware.guest.enable = true;

  # hostname
  networking.hostName = "orion";
  stars.mainUser = "r1";

  # home.nix
  #home-manager.users.r1.imports = [./home.nix];

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
