{
  pkgs,
  hyprland-contrib,
  sddm-sugar-catppuccin,
  hyprland,
  hyprlock,
  hyprpaper,
  ags,
  vscode-extensions,
  zen-browser,
  anyrun,
  ...
}:

{
  nixpkgs.overlays = [
    hyprland-contrib.overlays.default
    vscode-extensions.overlays.default
    (final: prev: {
      sddm-sugar-catppuccin = sddm-sugar-catppuccin.packages.${pkgs.system}.default;
      hyprland = hyprland.packages.${pkgs.system}.hyprland;
      xdg-desktop-portal-hyprland = hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
      hyprlock = hyprlock.packages.${pkgs.system}.hyprlock;
      hyprpaper = hyprpaper.packages.${pkgs.system}.hyprpaper;
      ags = ags.packages.${pkgs.system}.default;
      zen-browser = zen-browser.packages.${pkgs.system}.default;
      anyrun = anyrun.packages.${pkgs.system}.anyrun;
    })
  ];
}