{
  pkgs,
  hyprland-contrib,
  sddm-sugar-catppuccin,
  eww-tray,
  ...
}:

{
  nixpkgs.overlays = [
    hyprland-contrib.overlays.default
    (final: prev: {
      sddm-sugar-catppuccin = sddm-sugar-catppuccin.packages.${pkgs.system}.default;
      eww = eww-tray.packages.${pkgs.system}.default.override { withWayland = true; };
    })
  ];
}