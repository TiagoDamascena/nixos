{ pkgs, ... }:

{
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      batman
      batgrep
    ];
    config = {
      theme = "Coldark-Dark";
      style = "numbers,grid";
      chop-long-lines = true;
    };
  };
}
