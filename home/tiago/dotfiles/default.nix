{ ... }:

{
  home.file.alacritty = {
    source = ./.config/alacritty;
    target = ".config/alacritty";
    recursive = true;
  };

  home.file.hypr = {
    source = ./.config/hypr;
    target = ".config/hypr";
    recursive = true;
  };

  home.file.starship = {
    source = ./.config/starship.toml;
    target = ".config/starship.toml";
  };
}
