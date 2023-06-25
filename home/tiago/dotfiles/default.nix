{ ... }:

{
  home.file.alacritty = {
    source = ./.config/alacritty;
    target = ".config/alacritty";
    recursive = true;
  };

  home.file.eww = {
    source = ./.config/eww;
    target = ".config/eww";
    recursive = true;
  };

  home.file.hypr = {
    source = ./.config/hypr;
    target = ".config/hypr";
    recursive = true;
  };

  home.file.rofi = {
    source = ./.config/rofi;
    target = ".config/rofi";
    recursive = true;
  };

  home.file.starship = {
    source = ./.config/starship.toml;
    target = ".config/starship.toml";
  };

  home.file.swaync = {
    source = ./.config/swaync;
    target = ".config/swaync";
    recursive = true;
  };
}
