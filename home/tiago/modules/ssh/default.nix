{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "*" = {
        addKeysToAgent = "ask";
        compression = false;
        forwardAgent = false;
        setEnv = [
          "TERM=xterm-256color"
        ];
      };
    };
  };
}
