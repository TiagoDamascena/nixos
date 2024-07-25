{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dbeaver-bin
  ];

  xdg = {
    enable = true;

    desktopEntries = {
      dbeaver = {
        name = "DBeaver";
        genericName = "Database Manager";
        icon = "dbeaver";
        exec = "dbeaver -nosplash";
        terminal = false;
        categories = [ "Application" ];
        mimeType = [ "sql" ];
      };
    };
  };
}
