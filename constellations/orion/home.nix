{pkgs, ...}: {
  programs.home-manager.enable = true;

  home = {
    packages = with pkgs; [
      # other
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
