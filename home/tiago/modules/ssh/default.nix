{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        addKeysToAgent = "ask";
        compression = false;
        forwardAgent = false;
        setEnv = {
          "TERM" = "xterm-256color";
        };
      };
    };
  };
}
