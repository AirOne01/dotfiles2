{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # hardware scan
    ./hardware-configuration.nix
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

  # shells
  programs.zsh.enable = true;
  users.users.r1.shell = pkgs.zsh;

  # wm and compositing
  programs.hyprland.enable = true;

  home-manager = {
    users = {
      "r1" = {
        imports = [
          ./home.nix
        ];
      };
    };
  };

  #  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
