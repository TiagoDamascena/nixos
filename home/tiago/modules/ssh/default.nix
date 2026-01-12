{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        addKeysToAgent = "ask";
        compression = false;
        forwardAgent = false;
      };
    };
  };
}