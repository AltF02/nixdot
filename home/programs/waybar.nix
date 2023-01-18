{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  programs.waybar = {
    package = inputs.hyprland.packages.${pkgs.system}.waybar-hyprland;

    settings = [
      {
        layer = "top";
        position = "top";
        height = 0;

        modules-left = ["clock" "wlr/workspaces"];
        modules-center = ["hyprland/window"];
        modules-right = [
          "tray"
          "custom/caffeine"
          "network"
          "pulseaudio"
        ];

        modules = {
          "hyprland/window".format = "{}";
          "wlr/workspaces" = {
            "disable-scroll" = true;
            "all-outputs" = true;
            "on-click" = "activate";
            "persistent_workspaces" = {
              "1" = [];
              "2" = [];
              "3" = [];
              "4" = [];
              "5" = [];
              "6" = [];
              "7" = [];
              "8" = [];
              "9" = [];
              "10" = [];
            };
          };
          "custom/caffeine" = {
            exec = "${config.xdg.configHome}/waybar/scripts/caffeine.sh";
            "return-type" = "json";
            interval = 3;
            "format-icons" = [
              "\ufbc8"
              "\uf675"
            ];
            format = "{icon}";
          };
        };
      }
    ];

    style = ''
      * {
          border: none;
          border-radius: 0;
          font-family: monospace;
          font-weight: bold;
          font-size: 14px;
          min-height: 0;
      }

      window#waybar {
          background: rgba(21, 18, 27, 0);
          color: #cdd6f4;
      }

      tooltip {
          background: #1e1e2e;
          border-radius: 10px;
          border-width: 2px;
          border-style: solid;
          border-color: #11111b;
      }

      #workspaces button {
          padding: 5px;
          color: #313244;
          margin-right: 5px;
      }

      #workspaces button.active {
          color: #a6adc8;
      }

      #workspaces button.focused {
          color: #a6adc8;
          background: #eba0ac;
          border-radius: 10px;
      }

      #workspaces button.urgent {
          color: #11111b;
          background: #a6e3a1;
          border-radius: 10px;
      }

      #workspaces button:hover {
          background: #11111b;
          color: #cdd6f4;
          border-radius: 10px;
      }

      #custom-caffeine,
      #window,
      #clock,
      #battery,
      #pulseaudio,
      #network,
      #workspaces,
      #tray,
      #backlight {
          background: #1e1e2e;
          padding: 0px 10px;
          margin: 3px 0px;
          margin-top: 10px;
          border: 1px solid #181825;
      }

      #tray {
          border-radius: 10px;
          margin-right: 10px;
      }

      #workspaces {
          background: #1e1e2e;
          border-radius: 10px;
          margin-left: 10px;
          padding-right: 0px;
          padding-left: 5px;
      }

      #custom-caffeine {
          color: #89dceb;
          border-radius: 10px 0px 0px 10px;
          border-right: 0px;
          margin-left: 10px;
      }

      #window {
          border-radius: 10px;
          margin-left: 60px;
          margin-right: 60px;
      }

      #clock {
          color: #f9e2af;
          border-radius: 10px;
          margin-left: 10px;
      }

      #network {
          color: #fab387;
          border-left: 0px;
          border-right: 0px;
      }

      #pulseaudio {
          color: #89b4fa;
          border-left: 0px;
          border-right: 0px;
      }
    '';
  };
}
