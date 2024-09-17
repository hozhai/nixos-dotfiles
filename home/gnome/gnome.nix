{ pkgs, pkgs-stable, ... }:

{
  home.packages = with pkgs.gnomeExtensions; [
    gsconnect
    blur-my-shell
    appindicator
    custom-accent-colors
    arcmenu
    vitals
    user-themes
    dash-to-dock
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        clock-show-weekday = true;
      };

      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          gsconnect.extensionUuid
          blur-my-shell.extensionUuid
          appindicator.extensionUuid
          custom-accent-colors.extensionUuid
          arcmenu.extensionUuid
          vitals.extensionUuid
          user-themes.extensionUuid
          dash-to-dock.extensionUuid
        ];
      };

      "org/gnome/shell/extensions/blur-my-shell" = {
        brightness = 0.75;
        noise-amount = 0;
      };
    };
  };
}
