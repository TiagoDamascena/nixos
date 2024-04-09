{
  hyprlock-module,
  ...
}:

{
  imports = [ hyprlock-module ];

  programs.hyprlock = {
    enable = true;
  };
}