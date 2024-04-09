{
  pkgs,
  hyprland-contrib,
  sddm-sugar-catppuccin,
  hyprland,
  ...
}:

{
  nixpkgs.overlays = [
    hyprland-contrib.overlays.default
    (final: prev: {
      sddm-sugar-catppuccin = sddm-sugar-catppuccin.packages.${pkgs.system}.default;
      hyprland = hyprland.packages.${pkgs.system}.hyprland;
    })
  ];
}