{ pkgs, ... }:

{
  home.packages = with pkgs; [
    obsidian
  ];

  xdg.desktopEntries = {
    obsidian = {
      name = "Obsidian";
      genericName = "Database Manager";
      icon = "obsidian";
      exec = "obsidian %u --ozone-platform=x11";
      terminal = false;
      categories = [ "Office" ];
      mimeType = [ "x-scheme-handler/obsidian" ];
    };
  };
}
