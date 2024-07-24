{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # hardware scan
    ./hardware-configuration.nix
    # main user account
    ../../modules/main-user.nix
    # home-manager
    inputs.home-manager.nixosModules.default
  ];

  # bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # hostname
  networking.hostName = "cassiopeia";

  # networking (either of those)
  networking.networkmanager.enable = true;
  #networking.wireless.enable = true;

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

  # x11 keymap
  services.xserver = {
    xkb = {
      layout = "fr";
      variant = "";
    };
  };

  # well... fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
    noto-fonts-emoji
  ];

  # sound w/ pipewire
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

    # for most advanced wayland compositors
    nvidia.modesetting.enable = true;
  };

  # console keymap
  console.keyMap = "fr";

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
    # shells
    bash
  ];

  # shells
  programs.zsh.enable = true;

  # wm and compositing
  programs.hyprland.enable = true;

  # home-manager
  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = {inherit inputs;};
    users = {
      #"r1" = import ./home.nix;
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

  #  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
