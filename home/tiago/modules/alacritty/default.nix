{
  programs.alacritty = {
    enable = true;

    theme = "catppuccin_mocha";

    settings = {
      window = {
        dynamic_title = true;
        title = "Terminal";

        padding = {
          x = 10;
          y = 10;
        };
      };

      font = {
        size = 11;

        normal = {
          family = "JetBrainsMono Nerd Font";
        };
      };
    };
  };
}
