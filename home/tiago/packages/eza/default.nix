{ ... }:

{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    colors = "always";
    icons = "auto";
    extraOptions = [
      "--header"
      "--group-directories-first"
      "--oneline"
      "--group"
      "--time-style=long-iso"
    ];
  };
}
