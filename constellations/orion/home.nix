{pkgs, ...}: {
  programs.home-manager.enable = true;

  home = {
    username = "r1";
    homeDirectory = "/home/r1";
    #homeDirectory = lib.mkForce "/home/r1";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "24.05"; # Please read the comment before changing.

    packages = with pkgs; [
      # other
      ## hello world command
      hello
      ## screenshot tool
      grimblast

      # shells
      zellij

      # utils
      neofetch
      pfetch

      # networking
      atac
      networkmanagerapplet

      # fs management
      eza

      # terminal emulator
      kitty

      # file managers
      kdePackages.dolphin

      # media players
      vlc

      # text editors & ide
      vscodium
      nil
      alejandra

      # internet browser
      firefox
      chromium # waiting for thorium @ https://github.com/NixOS/nixpkgs/pull/284085
    ];

    sessionVariables = {
      # text editor
      EDITOR = "nvim";
      # wayland
      ## if the cursor becomes invisible
      WLR_NO_HARDWARE_CURSORS = "1";
      ## tell electron apps to use wayland
      NIXOS_OZONE_WL = "1";
    };
  };
}
