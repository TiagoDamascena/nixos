{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 10;

      border_size = 2;
      "col.active_border" = "rgba(ea76cbee) rgba(b4befeee) 45deg";
      "col.inactive_border" = "rgba(7f849cee)";
    };

    decoration = {
      rounding = 10;
      rounding_power = 4;

      blur = {
        size = 8;
        passes = 3;
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

    layerrule = [
      {
        name = "vicinae-blur";
        blur = "on";
        ignore_alpha = 0;
        "match:namespace" = "vicinae";
      }
      {
        name = "vicinae-no-animation";
        no_anim = "on";
        "match:namespace" = "vicinae";
      }
      {
        name = "struntuz-topbar-blur";
        blur = "on";
        blur_popups = "on";
        ignore_alpha = 0;
        "match:namespace" = "struntuz-topbar";
      }
      {
        name = "struntuz-control-center-blur";
        blur = "on";
        ignore_alpha = 0;
        "match:namespace" = "struntuz-control-center";
      }
      {
        name = "struntuz-toasts-blur";
        blur = "on";
        ignore_alpha = 0;
        "match:namespace" = "struntuz-toasts";
      }
      {
        name = "struntuz-media";
        blur = "on";
        ignore_alpha = 0;
        "match:namespace" = "struntuz-media";
      }
    ];
  };
}
