{
  programs.vicinae = {
    enable = true;
    systemd.enable = true;

    settings = {
      theme = {
        dark.name = "catppuccin-mocha";
      };

      font = {
        normal = {
          family = "Inter";
        };
      };

      launcher_window = {
        opacity = 0.72;
      };

      blur.enabled = true;

      favorites = [];
    };
  };
}