{
  programs.waybar = {
    enable = true;

    systemd = {
      enable = true;
    };

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 34;
        margin = "10 10 0";

        modules-left = [ "hyprland/workspaces" "mpris" ];
        modules-center = [ "clock" ];
        modules-right = [ "tray" "wireplumber" "network" "battery" "custom/notification" ];

        "hyprland/workspaces" = {
          all-outputs = true;
          move-to-monitor = true;

          persistent-workspaces = {
            "*" = 9;
          };
        };

        mpris = {
          format = "{player_icon}  {title}  {status_icon}";
          player-icons = {
            default = " ";
            spotify = "<span color=\"#a6e3a1\"> </span>";
            vlc = "<span color=\"#fab387\">󰕼 </span>";
          };
          status-icons = {
            playing = "";
            paused = "";
            stopped = "";
          };
          tooltip-format = "";
          dynamic-len = 40;
        };

        clock = {
          format = "{:L%A, %d de %B %H:%M}";
          locale = "pt_BR.UTF-8";
        };

        tray = {
          icon-size = 14;
          spacing = 10;
        };

        wireplumber = {
          format = "{icon}  {volume}%";
          format-icons = {
            headphone = " ";
            default = [" " " " " " " " " "];
          };
          on-click = "pavucontrol";
        };

        network = {
          format-ethernet = "󰈀";
          format-wifi = "    {essid}";
          format-disconnected = "󰪎";
          format-disabled = "disabled";
          tooltip = false;
        };

        "battery" = {
          format = "{icon}   {capacity}%";
          format-icons = [ "" "" "" "" "" ];
        };

        "custom/notification" = {
          tooltip = true;
          format = "{icon}";
          format-icons = {
            notification = "󱅫";
            none = "󰂜";
            dnd-notification = "󰂠";
            dnd-none = "󰪓";
            inhibited-notification = "󰂛";
            inhibited-none = "󰪑";
            dnd-inhibited-notification = "󰂛";
            dnd-inhibited-none = "󰪑";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };
      };
    };

    style = ''
      @define-color rosewater #f5e0dc;
      @define-color flamingo #f2cdcd;
      @define-color pink #f5c2e7;
      @define-color mauve #cba6f7;
      @define-color red #f38ba8;
      @define-color maroon #eba0ac;
      @define-color peach #fab387;
      @define-color yellow #f9e2af;
      @define-color green #a6e3a1;
      @define-color teal #94e2d5;
      @define-color sky #89dceb;
      @define-color sapphire #74c7ec;
      @define-color blue #89b4fa;
      @define-color lavender #b4befe;
      @define-color text #cdd6f4;
      @define-color subtext1 #bac2de;
      @define-color subtext0 #a6adc8;
      @define-color overlay2 #9399b2;
      @define-color overlay1 #7f849c;
      @define-color overlay0 #6c7086;
      @define-color surface2 #585b70;
      @define-color surface1 #45475a;
      @define-color surface0 #313244;
      @define-color base #1e1e2e;
      @define-color mantle #181825;
      @define-color crust #11111b;

      @define-color background rgba(30, 30, 46, 0.8);

      * {
        font-family: "Inter Nerd Font", sans-serif;
      }

      .module {
        padding: 0 20px;
        border-radius: 1rem;
        background-color: @background;
      }

      window#waybar {
        background: transparent;
        font-size: 14px;
        color: @text;
      }

      #workspaces {
        padding: 0 15px;
      }

      #workspaces button {
        padding: 0 5px;
        color: @overlay2;
        font-weight: normal;
      }

      #workspaces button.active {
        color: @mauve;
        border-radius: 1rem;
      }

      #workspaces button.empty {
        color: @overlay0;
      }

      #workspaces button:hover {
        background: transparent;
        color: @pink;
      }

      #mpris {
        margin-left: 10px;
      }

      #tray {
        margin-right: 10px;
      }

      #wireplumber {
        margin-right: 10px;
      }

      #network {
        margin-right: 10px
      }

      #battery {
        margin-right: 10px;
      }
    '';
  };
}
