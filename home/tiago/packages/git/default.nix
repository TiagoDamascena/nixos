{ ... }:

{
  programs.git = {
    enable = true;
    userName = "Tiago Damascena";
    userEmail = "tiagobdamascena@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
