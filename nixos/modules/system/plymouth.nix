{
  boot = {
    consoleLogLevel = 0;

    initrd.verbose = false;

    kernelParams = [
      "quiet"
      "loglevel=3"
      "systemd.show_status=false"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_level=3"
      "vt.global_cursor_default=0"
    ];

    plymouth = {
      enable = true;
      theme = "bgrt";
    };
  };
}
