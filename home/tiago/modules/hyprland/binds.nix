{ config, lib, ... }:

let
  inherit (lib.generators) mkLuaInline toLua;

  screenshot = "${config.xdg.userDirs.extraConfig.SCREENSHOTS}/$(date '+%Y-%m-%dT%H:%M:%S').png";

  # Key combo prefixed with the `mainMod` Lua local defined in general.nix.
  mod = keys: mkLuaInline "mainMod .. ${toLua { } " + ${keys}"}";

  # hl.dsp.<name>(<args>) — `args` is a Nix value converted to Lua (or null for no args).
  dsp = name: args: mkLuaInline "hl.dsp.${name}(${lib.optionalString (args != null) (toLua { } args)})";

  # Run a command; `cmd` is a raw Lua expression so it can reference the program locals.
  execLua = cmd: mkLuaInline "hl.dsp.exec_cmd(${cmd})";
  exec = cmd: dsp "exec_cmd" cmd;

  bind = keys: dispatcher: opts: {
    _args = [ keys dispatcher ] ++ lib.optional (opts != { }) opts;
  };

  workspaces = lib.range 1 9;
in
{
  wayland.windowManager.hyprland.settings.bind = [
    # Start application bindings
    (bind (mod "RETURN") (execLua ''"uwsm-app -- " .. terminal'') { })
    (bind (mod "SPACE") (execLua ''"uwsm-app -- " .. menu'') { })
    (bind (mod "H") (execLua ''"uwsm-app -- " .. history'') { })
    (bind (mod "E") (execLua ''"uwsm-app -- " .. fileManager'') { })

    # Window manipulation bindings
    (bind (mod "W") (dsp "window.close" null) { })
    (bind (mod "T") (dsp "window.float" { action = "toggle"; }) { })
  ]
  # Switch workspaces with mainMod + [1-9]
  ++ map (
    i:
    bind (mod (toString i)) (dsp "focus" {
      workspace = i;
      on_current_monitor = true;
    }) { }
  ) workspaces
  # Move active window to a workspace with mainMod + SHIFT + [1-9]
  ++ map (
    i:
    bind (mod "SHIFT + ${toString i}") (dsp "window.move" {
      workspace = i;
      follow = true;
    }) { }
  ) workspaces
  ++ [
    # Special workspace (scratchpad)
    (bind (mod "S") (dsp "workspace.toggle_special" "magic") { })
    (bind (mod "SHIFT + S") (dsp "window.move" {
      workspace = "special:magic";
      follow = true;
    }) { })

    # Scroll through existing workspaces with mainMod + scroll
    (bind (mod "mouse_down") (dsp "focus" { workspace = "e+1"; }) { })
    (bind (mod "mouse_up") (dsp "focus" { workspace = "e-1"; }) { })

    # Move/resize windows with mainMod + LMB/RMB and dragging
    (bind (mod "mouse:272") (dsp "window.drag" null) { mouse = true; })
    (bind (mod "mouse:273") (dsp "window.resize" null) { mouse = true; })

    # Screenshot keybindings
    (bind "Print" (exec "grim -g \"$(slurp)\" ${screenshot}") { })
    (bind "SHIFT + Print" (exec "grim -g \"$(slurp)\" - | satty --filename - --output-filename ${screenshot}") { })

    # Media keybindings
    (bind "XF86AudioMute" (exec "volumectl toggle-mute") { })
    (bind "XF86AudioMicMute" (exec "volumectl -m toggle-mute") { })
    (bind "XF86AudioPrev" (exec "playerctl previous") { })
    (bind "XF86AudioNext" (exec "playerctl next") { })
    (bind "XF86AudioPlay" (exec "playerctl play-pause") { })
    (bind "XF86AudioStop" (exec "playerctl stop") { })
    (bind "XF86AudioRaiseVolume" (exec "volumectl -u up") { repeating = true; })
    (bind "XF86AudioLowerVolume" (exec "volumectl -u down") { repeating = true; })

    # Brightness keybindings
    (bind "XF86MonBrightnessUp" (exec "lightctl up") { repeating = true; })
    (bind "XF86MonBrightnessDown" (exec "lightctl down") { repeating = true; })
  ];
}
