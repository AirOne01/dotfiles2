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

  # home.nix
  home-manager.users.r1.imports = [./home.nix];

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

  stars = {
    # boot
    plymouth.enable = true;
    # cli
    btop.enable = true;
    nvim.enable = true;
    oh-my-posh.enable = true;
    zsh.enable = true;
    # core
    pipewire.enable = true;
    garnix.enable = true;
    dev-python.enable = true;
    # gui
    gnome.enable = true;
    networkmanager.enable = true;

    # personal
    r1.enable = true;
    r1-git.enable = true;
  };
}
