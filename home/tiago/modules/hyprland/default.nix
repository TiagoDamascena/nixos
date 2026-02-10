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
  };
}
