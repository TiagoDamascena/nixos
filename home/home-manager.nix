{
  pkgs,
  home-manager,
  vscode-extensions,
  ags,
  hyprlock,
  anyrun,
  ...
}:

{
  imports = [ home-manager.nixosModules.default ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.tiago = import ./tiago;
    extraSpecialArgs = {
      vscode-marketplace = vscode-extensions.extensions.${pkgs.system}.vscode-marketplace;
      ags-module = ags.homeManagerModules.default;
      hyprlock-module = hyprlock.homeManagerModules.hyprlock;
      anyrun-module = anyrun.homeManagerModules.default;
    };
  };
}