{
  pkgs,
  home-manager,
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
      ags-module = ags.homeManagerModules.default;
      hyprlock-module = hyprlock.homeManagerModules.hyprlock;
      anyrun-module = anyrun.homeManagerModules.default;
    };
  };
}