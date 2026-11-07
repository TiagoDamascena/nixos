{
  imports = [
    ./binds.nix
    ./exec.nix
    ./general.nix
    ./input.nix
    ./layouts.nix
    ./monitors.nix
    ./theme.nix
    ./windowrules.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    # Hyprland >= 0.57 reads hyprland.lua; hyprlang (hyprland.conf) is ignored
    # once a hyprland.lua exists, so generate the Lua config.
    configType = "lua";
  };
}
