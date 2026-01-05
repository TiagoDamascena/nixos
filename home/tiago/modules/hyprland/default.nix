{
  imports = [
    ./binds.nix
    ./general.nix
    ./layouts.nix
    ./monitors.nix
    ./theme.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
  };
}