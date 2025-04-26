{
  pkgs,
  home-manager,
  ags,
  hyprlock,
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
    };
  };
}