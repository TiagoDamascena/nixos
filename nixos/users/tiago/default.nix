{ pkgs, ... }:

{
  users.users.tiago = {
    isNormalUser = true;
    description = "Tiago";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      vscode
      firefox
    ];
  };

  home-manager.users.tiago = import ../../../home/tiago;
}
