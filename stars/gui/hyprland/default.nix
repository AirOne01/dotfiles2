{
  lib,
  pkgs,
  config,
  ...
}: let
  hyprlandStar = lib.mkStar {
    name = "hyprland";

    packages = with pkgs; [
      # diy rust widgets
      eww

      # notifications
      libnotify
      dunst

      # wallpaper deamon
      swww

      # app launcher
      rofi-wayland
    ];

    extraHomeConfig = {
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
                "$mainMod SHIFT, A, killactive,"
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
              ]
              ++
              # workspaces
              # binds $mainMod + [shift +] {1..10} to [move to] workspace {1..10}
              builtins.concatLists (builtins.genList (
                  x: let
                    ws = let
                      c = (x + 1) / 10;
                    in
                      builtins.toString (x + - (c * 10));
                  in [
                    "$mainMod, code:${toString (x + 10)}, workspace, ${toString (x + 1)}"
                    "$mainMod SHIFT, code:${toString (x + 10)}, movetoworkspace, ${toString (x + 1)}"
                  ]
                )
                10);

            # input config
            input = {
              kb_layout = "fr,us";
              kb_options = "grp:caps_toggle";
            };

            exec-once = "bash ~/.config/hypr/start.sh";
          };
        };
      };
    };
  };
in {
  imports = [hyprlandStar];

  config.stars.pipewire = lib.mkIf config.stars.hyprland.enable {enable = lib.mkDefault true;};
}
