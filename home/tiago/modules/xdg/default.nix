{ config, ... }:

{
  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = true;

      desktop = null;
      music = null;
      publicShare = null;
      templates = null;

      extraConfig = {
        SCREENSHOTS = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };

    mimeApps = {
      enable = true;

      defaultApplications = {
        "application/pdf" = "org.gnome.Papers.desktop";
        "image/png" = "org.gnome.Loupe.desktop";
        "image/jpeg" = "org.gnome.Loupe.desktop";
        "x-scheme-handler/bitwarden" = "bitwarden.desktop";
        "x-scheme-handler/claude" = "com.anthropic.Claude.desktop";
        "x-scheme-handler/claude-cli" = "claude-code-url-handler.desktop";
        "x-scheme-handler/plane" = "plane-desktop.desktop";
        "x-scheme-handler/x-github-client" = "github-desktop.desktop";
        "x-scheme-handler/x-github-desktop-dev-auth" = "github-desktop.desktop";
      };
    };
  };
}
