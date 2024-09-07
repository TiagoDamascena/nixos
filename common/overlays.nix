{
  pkgs,
  hyprland-contrib,
  sddm-sugar-catppuccin,
  hyprland,
  xdg-desktop-portal-hyprland,
  hyprlock,
  hyprpaper,
  zen-browser,
  ...
}:

{
  nixpkgs.overlays = [
    hyprland-contrib.overlays.default
    (final: prev: {
      sddm-sugar-catppuccin = sddm-sugar-catppuccin.packages.${pkgs.system}.default;
      xdg-desktop-portal-hyprland = xdg-desktop-portal-hyprland.packages.${pkgs.system}.default;
      hyprland = hyprland.packages.${pkgs.system}.hyprland;
      hyprlock = hyprlock.packages.${pkgs.system}.hyprlock;
      hyprpaper = hyprpaper.packages.${pkgs.system}.hyprpaper;
      zen-browser = zen-browser.packages.${pkgs.system}.default;
    })
  ];
}