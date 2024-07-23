{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # hardware scan
    ./hardware-configuration.nix
    # main user account
    ../../main-user.nix
    # home-manager
    inputs.home-manager.nixosModules.default
    # plymouth
    ../../modules/plymouth.nix
  ];

  # overlays
  nixpkgs.overlays = [
    (_: prev: {
      gnome = prev.gnome.overrideScope (_: gnomePrev: {
        mutter = gnomePrev.mutter.overrideAttrs (_: {
          src = pkgs.fetchFromGitLab {
            domain = "gitlab.gnome.org";
            owner = "vanvugt";
            repo = "mutter";
            rev = "triple-buffering-v4-46";
            hash = "sha256-nz1Enw1NjxLEF3JUG0qknJgf4328W/VvdMjJmoOEMYs=";
          };
        });
      });
    })
  ];

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

  # time zone
  time.timeZone = "Europe/Paris";

  # internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  services = {
    # x11
    xserver = {
      enable = true;

      xkb = {
        layout = "us";
        variant = "";
      };

      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    # gnome-settings-daemon udev rules
    udev.packages = with pkgs; [gnome.gnome-settings-daemon];
  };

  environment.gnome.excludePackages =
    (with pkgs; [
      gnome-photos
      gnome-tour
      gedit # text editor
    ])
    ++ (with pkgs.gnome; [
      cheese
      gnome-music
      evince # document viewer
      gnome-characters
      totem # video video player
    ]);

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

    # for most advanced wayland compositors
    #nvidia.modesetting.enable = true;
  };

  # console
  console = {
    keyMap = "us";
    font = "ter-v16b";
    packages = with pkgs; [terminus_font];
  };

  # user accounts
  main-user.enable = true;
  main-user.userName = "r1";

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

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
    # also pass inputs to home-manager modules
    extraSpecialArgs = {inherit inputs;};
    users = {
      "r1" = {
        imports = [
          inputs.nvf.homeManagerModules.default
          ./home.nix
        ];
      };
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
