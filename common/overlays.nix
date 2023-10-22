{
  pkgs,
  hyprland-contrib,
  sddm-sugar-catppuccin,
  eww-tray,
  hyprland,
  ...
}:

{
  nixpkgs.overlays = [
    hyprland-contrib.overlays.default
    (final: prev: {
      sddm-sugar-catppuccin = sddm-sugar-catppuccin.packages.${pkgs.system}.default;
      eww = eww-tray.packages.${pkgs.system}.default.override { withWayland = true; };
      hyprland = hyprland.packages.${pkgs.system}.hyprland;
      vscode = prev.vscode.overrideAttrs(oldAttrs: rec {
        name = "vscode";
        version = "1.81.1";
        src = pkgs.fetchurl {
          name = "VSCode_${version}_linux-x64.tar.gz";
          url = "https://update.code.visualstudio.com/${version}/linux-x64/stable";
          hash = "sha256:0j3lmyj77qalhn8hrgfg3zgw6jqv8rscfy16vhkl0ir2xnmb19jf";
        };
      });
    })
  ];
}