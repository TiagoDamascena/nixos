{
  programs.hyprlock = {
    enable = true;

    settings = {
      "$font" = "Rubik";
      "$base" = "rgb(1e1e2e)";
      "$accent" = "rgb(cba6f7)";
      "$text" = "rgb(cdd6f4)";
      "$surface0" = "rgb(313244)";
      "$surface2" = "rgb(585b70)";
      "$red" = "rgb(f38ba8)";
      "$yellow" = "rgb(f9e2af)";
      "$white" = "rgb(ffffff)";

      general = {
        hide_cursor = true;
      };

      background = {
        monitor = "";
        path = "$HOME/.config/wallpaper";
        blur_passes = 2;
        blur_size = 4;
        brightness = 0.8;
        color = "$base";
      };

      label = [
        {
          monitor = "";
          text = "cmd[update:43200000] date +'%A, %d de %B'";
          color = "$text";
          font_size = 18;
          font_family = "$font";
          position = "0, -100";
          halign = "center";
          valign = "top";
        }
        {
          monitor = "";
          text = "$TIME";
          color = "$text";
          font_size = 128;
          font_family = "$font";
          position = "0, -110";
          halign = "center";
          valign = "top";
        }
        {
          monitor = "";
          text = "$DESC";
          color = "$white";
          font_size = 14;
          font_family = "$font";
          position = "0, 250";
          halign = "center";
          valign = "bottom";
        }
      ];

      image = {
        monitor = "";
        path = "$HOME/.config/avatar";
        size = 80;
        border_size = 0;
        border_color = "$accent";
        position = "0, 280";
        halign = "center";
        valign = "bottom";
      };

      input-field = {
        monitor = "";
        size = "280, 36";
        outline_thickness = 1;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = "$surface2";
        inner_color = "$surface0";
        font_color = "$text";
        fade_on_empty = false;
        placeholder_text = "Digite sua senha";
        hide_input = false;
        check_color = "$accent";
        fail_color = "$red";
        fail_text = "Senha incorreta";
        capslock_color = "$yellow";
        position = "0, 200";
        halign = "center";
        valign = "bottom";
      };
    };
  };
}