let
  blurredLayer = name: namespace: extra: {
    inherit name;
    match.namespace = namespace;
    blur = true;
    ignore_alpha = 0;
  } // extra;
in
{
  wayland.windowManager.hyprland.settings = {
    config = {
      general = {
        gaps_in = 5;
        gaps_out = 10;

        border_size = 2;
        col = {
          active_border = {
            colors = [ "rgba(ea76cbee)" "rgba(b4befeee)" ];
            angle = 45;
          };
          inactive_border = "rgba(7f849cee)";
        };
      };

      decoration = {
        rounding = 10;
        rounding_power = 4;

        blur = {
          size = 8;
          passes = 3;
        };
      };

      animations.enabled = true;
    };

    animation =
      map
        (
          a:
          {
            enabled = true;
            bezier = "default";
          }
          // a
        )
        [
          { leaf = "windowsIn"; speed = 6; }
          { leaf = "windowsOut"; speed = 6; }
          { leaf = "windowsMove"; speed = 4; }
          { leaf = "border"; speed = 6; }
          { leaf = "borderangle"; speed = 6; }
          { leaf = "fade"; speed = 4; }
          { leaf = "workspaces"; speed = 4; }
          { leaf = "specialWorkspace"; speed = 4; style = "slidevert"; }
        ];

    layer_rule = [
      (blurredLayer "vicinae-blur" "vicinae" { })
      {
        name = "vicinae-no-animation";
        match.namespace = "vicinae";
        no_anim = true;
      }
      (blurredLayer "struntuz-topbar-blur" "struntuz-topbar" { blur_popups = true; })
      (blurredLayer "struntuz-control-center-blur" "struntuz-control-center" { })
      (blurredLayer "struntuz-toasts-blur" "struntuz-toasts" { })
      (blurredLayer "struntuz-media" "struntuz-media" { })
      (blurredLayer "struntuz-calendar" "struntuz-calendar" { })
    ];
  };
}
