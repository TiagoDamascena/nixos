{ pkgs, ... }:

{
  home.packages = with pkgs; [
    slack
  ];

  xdg.desktopEntries.slack = {
    name = "Slack";
    genericName = "Slack Client for Linux";
    icon = "slack";
    exec = "slack -s %U --ozone-platform=x11";
    terminal = false;
    categories = [ "InstantMessaging" ];
    mimeType = [ "x-scheme-handler/slack" ];
  };
}
