{
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    policies = {
      DontCheckDefaultBrowser = true;

      ExtensionSettings =
        builtins.mapAttrs
          (_: slug: {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/${slug}/latest.xpi";
            installation_mode = "force_installed";
          })
          {
            "uBlock0@raymondhill.net" = "ublock-origin";
            "{446900e4-71c2-419f-a6a7-df9c091e268b}" = "bitwarden-password-manager";
            "pt-BR@dictionaries.addons.mozilla.org" = "corretor";
          };
    };

    profiles.default = {
      id = 0;
      isDefault = true;

      settings = {
        # Zen
        "zen.welcome-screen.seen" = true;
        "zen.view.compact.enable-at-startup" = false;
        "zen.view.use-single-toolbar" = false;
        "zen.theme.hide-unified-extensions-button" = true;

        # Appearance
        "browser.tabs.inTitlebar" = 1;
        "browser.theme.toolbar-theme" = 0;
        "widget.use-xdg-desktop-portal.file-picker" = 1;

        # Search and URL bar
        "browser.search.separatePrivateDefault" = false;
        "browser.urlbar.shortcuts.bookmarks" = false;
        "browser.bookmarks.showMobileBookmarks" = false;
        "browser.translations.automaticallyPopup" = false;

        # Privacy (passwords live in Bitwarden)
        "signon.rememberSignons" = false;
        "dom.forms.autocomplete.formautofill" = true;
        "privacy.history.custom" = true;
        "privacy.clearOnShutdown_v2.formdata" = true;
        "network.prefetch-next" = false;
        "network.http.speculative-parallel-limit" = 0;

        "pdfjs.enableAltText" = false;

        # No Top Sites mod: hide all results when opening the URL bar
        "mod.ivaon.urlbar.hide_results" = "0";
      };

      mods = [
        "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
        "599a1599-e6ab-4749-ab22-de533860de2c" # Pimp your PiP
      ];

      extensionButtons = {
        "nav-bar" = [ "{446900e4-71c2-419f-a6a7-df9c091e268b}" ];
        "unified-extensions-area" = [ "uBlock0@raymondhill.net" ];
      };

      search = {
        force = true;
        default = "google";
        engines = {
          bing.metaData.hideOneOffButton = true;
          mercadolivre.metaData.hideOneOffButton = true;
          perplexity.metaData.hideOneOffButton = true;
          wikipedia-pt.metaData.hideOneOffButton = true;
        };
      };

      spaces."Space" = {
        id = "80a4d47f-a9bb-4c72-9c2d-a595bcb5bef6";
        position = 2000;
        theme = {
          type = "gradient";
          colors =
            map
              (c: c // {
                algorithm = "analogous";
                type = "explicit-lightness";
                lightness = 55;
              })
              [
                { red = 80; green = 75; blue = 206; primary = true; position = { x = 144; y = 111; }; }
                { red = 172; green = 69; blue = 211; primary = false; position = { x = 197; y = 113; }; }
                { red = 74; green = 157; blue = 206; primary = false; position = { x = 108; y = 151; }; }
              ];
          opacity = 0.44;
          texture = 0.375;
        };
      };

      # Essentials are replaced on every switch: undeclared ones are removed.
      pinsForce = true;
      pinsForceAction = "remove";
      pins = {
        "YouTube" = {
          id = "4ebff31f-ba9c-4062-8f6a-39f398a284b4";
          url = "https://www.youtube.com/";
          position = 101;
          isEssential = true;
        };
        "Gmail" = {
          id = "4a834cde-3c4b-4984-a196-1457df09fa09";
          url = "https://mail.google.com/mail/u/0/";
          position = 102;
          isEssential = true;
        };
        "WhatsApp" = {
          id = "47da93ae-eaf1-481a-811d-34c3fa8e199c";
          url = "https://web.whatsapp.com/";
          position = 103;
          isEssential = true;
        };
        "Claude" = {
          id = "fc643b1a-3089-4c05-9254-86e76aed6745";
          url = "https://claude.ai/new";
          position = 104;
          isEssential = true;
        };
        "GitHub" = {
          id = "2612b6b1-41c1-4408-bf50-c4159ba70f90";
          url = "https://github.com/";
          position = 105;
          isEssential = true;
        };
        "Plane" = {
          id = "35e0500c-e340-4c2f-b89b-b3045885a126";
          url = "https://app.plane.so/nrzero/";
          position = 106;
          isEssential = true;
        };
      };
    };
  };
}
