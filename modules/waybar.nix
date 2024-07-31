{pkgs, ...}: {
  home.packages = with pkgs; [
    waybar
    python3
  ];

  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];
        modules-left = [];
        modules-center = [];
        modules-right = ["custom/weather"];

        "custom/weather" = {
          format = "{}";
          tooltip = true;
          interval = 3600;
          exec = "./weather.py";
          return-type = "json";
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: Source Code Pro;
      }
      window#waybar {
        background: #232136;
        color: #ebbcba;
        border: 1px solid #ebbcba;
        border-radius: 1rem;
      }
      #custom-weather {
        background: #393552;
        padding: 0.5rem;
        margin: 0.5rem;
        border-radius: 1rem;
      }
    '';
  };

  home.file.".config/waybar/weather.py".source = ./waybar/weather.py;
}
