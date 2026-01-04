{
  imports = [
    ./hardware.nix
    ../../core
    ../../users/tiago
    ../../modules/system/hyprland.nix
  ];

  networking.hostName = "desktop";

  hardware.graphics = {
    enable = true;
  };

  hardware.nvidia = {
    open = true;

    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
  };

  services.xserver = {
    xkb = {
      layout = "us";
      variant = "";
    };

    videoDrivers = ["nvidia"];
  };
}