{ home-manager, struntuz-topbar, ... }:

{
  imports = [ home-manager.nixosModules.home-manager ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    sharedModules = [ struntuz-topbar.homeModules.default ];
  };
}
