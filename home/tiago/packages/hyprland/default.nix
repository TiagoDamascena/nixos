{
  pkgs,
  lib,
  osConfig,
  ...
}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    systemdIntegration = true;
    package = pkgs.hyprland;

    xwayland = {
      enable = true;
    };

    settings = {
      monitor = (
        [
          ",addreserved,50,0,0,0"
        ]
        ++
        (if (osConfig.networking.hostName == "vivobook") then [
          "eDP-1,1920x1080@60,0x0,1"
          ",preferred,auto,1"
        ] else if (osConfig.networking.hostName == "desktop") then [
          "HDMI-A-1, 2560x1080@75, 0x560, 1"
          "HDMI-A-2, 1920x1080@60, 2560x0, 1, transform, 3"
        ] else [ ])
      );

      exec-once = (
        [
          "dbus-update-activation-environment --all"
          "gnome-keyring-daemon -sd"
          "wl-clip-persist --clipboard regular"
          "swaync"
          "avizo-service"
        ]
        ++
        (if (osConfig.networking.hostName == "vivobook") then [
          "kanshi"
        ] else if (osConfig.networking.hostName == "desktop") then [
          "hyprpaper"
          "eww open bar0"
          "eww open bar1"
        ] else [ ])
      );

      env = [
        "XCURSOR_SIZE,24"
      ];

      input = {
        kb_layout = "br";
        kb_variant = "abnt2";

        follow_mouse = 1;

        touchpad = {
            natural_scroll = "yes";
        };

        sensitivity = 0;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(ea76cbee) rgba(b4befeee) 45deg";
        "col.inactive_border" = "rgba(7f849cee)";

        layout = "dwindle";
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      decoration = {
        rounding = 5;
        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";

        blur = {
            enabled = "yes";
            size = 3;
            passes = 1;
            new_optimizations = "yes";
        };
      };

      animations = {
        enabled = "yes";

        animation = [
          "windowsIn, 1, 6, default"
          "windowsOut, 1, 6, default"
          "windowsMove, 1, 4, default"
          "border, 1, 6, default"
          "borderangle, 1, 6, default"
          "fade, 1, 4, default"
          "workspaces, 1, 4, default"
          "specialWorkspace, 1, 4, default, slidevert"
        ];
      };

      dwindle = {
        pseudotile = false;
        force_split = 2;
        preserve_split = false;
      };

      master = {
        new_is_master = false;
      };

      gestures = {
        workspace_swipe = "off";
      };

      windowrulev2 = [
        "float, class:^(org.gnome.Calculator)$"
        "workspace 2 silent, class:^(Postman)$"
        "workspace 4 silent, class:^(discord)$"
        "workspace 4 silent, class:^(Slack)$"
        "workspace 4 silent, class:^(whatsapp-for-linux)$"
        "workspace 5 silent, class:^(Spotify)$"
        "workspace 6 silent, class:^(code-url-handler)$"
        "workspace 7 silent, class:^(DBeaver)$"
      ];

      layerrule = [ ];

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, RETURN, exec, alacritty"
        "$mainMod, SPACE, exec, rofi -show drun -theme ~/.config/rofi/theme/launcher.rasi"
        "$mainMod, R, exec, rofi -show run -theme ~/.config/rofi/theme/runner.rasi"
        "$mainMod, E, exec, nautilus"

        # Window manipulation bindings
        "$mainMod, W, killactive,"
        "$mainMod, T, togglefloating,"

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, exec, try_swap_workspace 1"
        "$mainMod, 2, exec, try_swap_workspace 2"
        "$mainMod, 3, exec, try_swap_workspace 3"
        "$mainMod, 4, exec, try_swap_workspace 4"
        "$mainMod, 5, exec, try_swap_workspace 5"
        "$mainMod, 6, exec, try_swap_workspace 6"
        "$mainMod, 7, exec, try_swap_workspace 7"
        "$mainMod, 8, exec, try_swap_workspace 8"
        "$mainMod, 9, exec, try_swap_workspace 9"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Scratchpad keybindings1
        "$mainMod, s, togglespecialworkspace, scratchpad"
        "$mainMod SHIFT, s, exec, scratchpad"
        "$mainMod ALT, s, exec, scratchpad -g"

        # Screenshot keybindings
        ", Print, exec, grimblast copysave screen"
        "SHIFT, Print, exec, grimblast --freeze copysave area"

        # Media keybindings
        ", XF86AudioMute, exec, volumectl toggle-mute"
        ", XF86AudioMicMute, exec, volumectl -m toggle-mute"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioStop, exec, playerctl stop"
      ];

      binde = [
        # Media keybindings
        ", XF86AudioRaiseVolume, exec, volumectl -u up"
        ", XF86AudioLowerVolume, exec, volumectl -u down"

        # Brightness keybindings
        ", XF86MonBrightnessUp, exec, lightctl up"
        ", XF86MonBrightnessDown, exec, lightctl down"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}