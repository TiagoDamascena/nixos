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
      packages = with pkgs; [
        vscode
        firefox
      ];
    };
  };

  home-manager.users.tiago = import ../../../home/tiago;
}
