{pkgs, ...}: {
  #programs.home-manager.enable = true;

  home = {
    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages = with pkgs; [
      # screenshot tool
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

      # programming languages
      bun
      nodejs_22

      # internet browser
      firefox
      chromium # waiting for thorium @ https://github.com/NixOS/nixpkgs/pull/284085

      # github helper
      gh
    ];

    # Home Manager can also manage your environment variables through
    # 'home.sessionVariables'. These will be explicitly sourced when using a
    # shell provided by Home Manager. If you don't want to manage your shell
    # through Home Manager then you have to manually source 'hm-session-vars.sh'
    # located at either
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/r1/etc/profile.d/hm-session-vars.sh
    #
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
