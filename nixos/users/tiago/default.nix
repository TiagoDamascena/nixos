{ pkgs, ... }:

{
  users = {
    groups.tiago = {
      gid = 1000;
    };

    users.tiago = {
      uid = 1000;
      isNormalUser = true;
      description = "Tiago Damascena";

      group = "tiago";
      extraGroups = [ "wheel" "networkmanager" ];

      shell = pkgs.fish;
    };
  };

  home-manager.users.tiago = import ../../../home/tiago;
}
