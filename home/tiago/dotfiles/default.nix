{ ... }:

{
  home.file.alacritty = {
    source = ./.config/alacritty;
    target = ".config/alacritty";
    recursive = true;
  };

  home.file.avizo = {
    source = ./.config/avizo;
    target = ".config/avizo";
    recursive = true;
  };

  home.file.hypridle = {
    source = ./.config/hypr/hypridle.conf;
    target = ".config/hypr/hypridle.conf";
    recursive = true;
  };

  home.file.hyprlock = {
    source = ./.config/hypr/hyprlock.conf;
    target = ".config/hypr/hyprlock.conf";
    recursive = true;
  };

  home.file.hyprpaper = {
    source = ./.config/hypr/hyprpaper.conf;
    target = ".config/hypr/hyprpaper.conf";
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

  home.file.vscode-args = {
    source = ./.vscode/argv.json;
    target = ".vscode/argv.json";
  };

  home.file.settings = {
    source = ./.settings;
    target = ".settings";
    recursive = true;
  };
}
