{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "r1";
  home.homeDirectory = "/home/r1";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # other
    ## hello world command
    pkgs.hello
    ## screenshot tool
    pkgs.grimblast

    # shells
    pkgs.oh-my-posh
    pkgs.zellij

    # utils
    pkgs.btop
    pkgs.neofetch
    pkgs.pfetch

    # networking
    pkgs.atac
    pkgs.networkmanagerapplet

    # fs management
    pkgs.eza

    # wm and compositing
    ## wm
    pkgs.wayland
    pkgs.wev # wayland debug
    ## compositor
    pkgs.hyprland
    ## status bar
    ## waybar experimental flag
    (pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )
    #eww # full diy solution
    ## notifications
    pkgs.libnotify
    pkgs.dunst
    ## wallpaper deamon
    pkgs.swww
    ## app launcher
    pkgs.rofi-wayland

    # terminal emulator
    pkgs.kitty

    # file managers
    pkgs.kdePackages.dolphin

    # media players
    pkgs.vlc

    # text editors & ide
    pkgs.vscode
    ## language servers
    pkgs.nil

    # internet browser
    pkgs.firefox
    pkgs.google-chrome

    # github helper
    pkgs.gh

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # wayland and hyprland
  wayland.windowManager = {
    hyprland = {
      enable = true;
      ## to run X apps on wayland
      xwayland.enable = true;
      
      ## input config (using xorg-type config, even if it's wayland)

      # config
      settings = {
        "$mainMod" = "SUPER";
        bind =
          [
            # compositor
            "$mainMod SHIFT, Q, killactive,"
            "$mainMod, F, fullscreen,"
            "$mainMod, G, togglegroup,"
            "$mainMod SHIFT, M, exec, hyprand reload"
            #"$mainmod SHIFT, E, exec, pkill hyprland"

            # apps
            ## terminal
            "$mainMod, return, exec, kitty"
            ## rofi
            "$mainMod, S, exec, rofi -show drun -show-icons"
            ## web browser
            "$mainMod SHIFT, F, exec, firefox"
            ## screenshot tool screen
            ", print, exec, grimblast copy area"

	    ## stupid french keyboard
            #"$mainMod, code:10, workspace, 1"
            #"$mainMod, code:11, workspace, 2"
            #"$mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]
	     ++
          # workspaces
          # binds $mainMod + [shift +] {1..10} to [move to] workspace {1..10}
          builtins.concatLists (builtins.genList (
            x: let
            ws = let
            c = (x + 1) / 10;
            in
              builtins.toString (x +  - (c * 10));
            in [
              "$mainMod, code:${toString (x + 10)}, workspace, ${toString (x + 1)}"
              "$mainMod SHIFT, code:${toString (x + 10)}, movetoworkspace, ${toString (x + 1)}"
            ]
          ) 10);

        # input config
        input = {
          kb_layout = "fr,us";
          kb_options = "grp:caps_toggle";
        };

        exec-once = "bash ~/.config/hypr/start.sh";
      };
    };
  };

  # zsh config
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      l = "eza -laag --git --icons";
      update = "sudo nixos-rebuild switch --flake /home/r1/.nixos/#default";
      zz = "zellij -l compact";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    useTheme = "M365Princess";
  };

  # xdg
  #xdg.portal = {
  #  enable = true;
  #  extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  #};

  # btop config
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "horizon";
      update_ms = "200";
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

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
  home.sessionVariables = {
    # text editor
    EDITOR = "nvim";
    # wayland
    ## if the cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    ## tell electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
