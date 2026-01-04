{
  boot = {
    consoleLogLevel = 0;

    initrd.verbose = false;

    kernelParams = [ "quiet" "splash" "udev.log_level=0" ];

    plymouth = {
      enable = true;
      theme = "bgrt";
    };
  };
}
