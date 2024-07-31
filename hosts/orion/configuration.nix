{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../stars
  ];

  # personal framework
  stars = {
    enable = true;

    userName = "r1";

    gui = {
      gnome.enable = true;
      plymouth.enable = true;
    };

    personal = {
      enable = true;
      nvim.enable = true;
      git.enable = true;
    };

    cli = {
      btop.enable = true;
      oh-my-posh.enable = true;
      zsh.enable = true;
    };

    code.garnix.enable = true;

    core.sound.enable = true;
  };

  # Use the GRUB 2 boot loader.
  boot.loader.grub = {
    enable = true;

    device = "/dev/sda";
    useOSProber = true;
  };

  # shell
  programs.zsh.enable = true;
  users.users.r1.shell = pkgs.zsh;

  # hostname
  networking.hostName = "orion";

  # networking (either of those)
  networking.networkmanager.enable = true;

  # sound w/ pipewire
  #sound.enable = true; # not to use with alsa
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # hardware configs
  hardware = {
    # opengl
    graphics.enable = true;

    # disable pulesaudio
    pulseaudio.enable = false;
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

  # home-manager
  home-manager = {
    users = {
      "r1" = {
        #name = "r1";
        #home = "/home/r1";

        imports = [
          ./home.nix
        ];
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
