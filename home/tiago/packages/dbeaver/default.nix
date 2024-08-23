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
        exec = "env GDK_BACKEND=x11 dbeaver -nosplash";
        terminal = false;
        categories = [ "Application" ];
        mimeType = [ "sql" ];
      };
    };
  };
}
