{
  imports = [
    ../../common/overlays.nix
    ../../common/system.nix
    ../../home/home-manager.nix
    ./hardware.nix
  ];

  networking.hostName = "desktop";

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
  };
}