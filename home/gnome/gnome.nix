{
  pkgs,
  pkgs-stable,
  ...
}: {
  imports = [
  ];

  home.file."./Pictures/wallpaper.jpg".source = ../assets/wallpaper.jpg;

  home.packages =
    (with pkgs.gnomeExtensions; [
      # Extensions
      gsconnect
      blur-my-shell
      appindicator
      custom-accent-colors
      vitals
      user-themes
      dash-to-dock
      quick-settings-tweaker
      desktop-cube
      gnome-40-ui-improvements
      removable-drive-menu
      transparent-window-moving
      caffeine
      coverflow-alt-tab
      compiz-alike-magic-lamp-effect
      gtile
    ])
    ++ (with pkgs; [
      # Others
      numix-icon-theme
      posy-cursors
    ]);

  gtk = {
    enable = true;
    iconTheme = {
      name = "Numix";
      package = pkgs.numix-icon-theme;
    };

    cursorTheme = {
      name = "Posy_Cursor_Black";
      package = pkgs.posy-cursors;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        clock-show-weekday = true;
      };

      "org/gnome/desktop/background" = {
        "picture-uri-dark" = "/home/zhai/Pictures/wallpaper.jpg";
      };

      "org/gnome/desktop/screensaver" = {
        "picture-uri" = "/home/zhai/Pictures/wallpaper.jpg";
      };

      "org/gnome/shell" = {
        disable-user-extensions = false;
        favorite-apps = [
          "zen.desktop"
          "Alacritty.desktop"
          "vesktop.desktop"
          "spotify.desktop"
        ];
        enabled-extensions = with pkgs.gnomeExtensions; [
          gsconnect.extensionUuid
          blur-my-shell.extensionUuid
          appindicator.extensionUuid
          custom-accent-colors.extensionUuid
          vitals.extensionUuid
          user-themes.extensionUuid
          dash-to-dock.extensionUuid
          quick-settings-tweaker.extensionUuid
          desktop-cube.extensionUuid
          gnome-40-ui-improvements.extensionUuid
          removable-drive-menu.extensionUuid
          transparent-window-moving.extensionUuid
          caffeine.extensionUuid
          coverflow-alt-tab.extensionUuid
          compiz-alike-magic-lamp-effect.extensionUuid
          gtile.extensionUuid
        ];
      };

      "org/gnome/shell/extensions/blur-my-shell" = {
        brightness = 0.75;
        noise-amount = 0;
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        apply-custom-theme = true;
        background-opacity = 0.8;
        custom-theme-shrink = true;
        dash-max-icon-size = 48;
        extend-height = false;
        dock-position = "BOTTOM";
        multi-monitor = true;
        running-indicator-style = "DASHES";
        transparency-mode = "DYNAMIC";
      };

      "org/gnome/shell/extensions/vitals" = {
        hot-sensors = ["__temperature_avg__" "_processor_usage_" "_network-rx_eno1_rx_" "_network-tx_eno1_tx_"];
        icon-style = 1;
        position-in-panel = 2;
        show-temperature = true;
      };
    };
  };
}
