{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    tofi
    kitty
    feh
    vlc
    autotiling
  ];

  xdg.configFile."sway/config".source = pkgs.lib.mkOverride 0 ./config;

  wayland.windowManager.sway = {
    enable = true;
  };

  programs.i3status-rust = {
    enable = true;
    bars = {
      default = {
        blocks = [
          {
            block = "cpu";
            interval = 1;
          }
          {
            block = "memory";
            format_mem = " $icon $mem_used_percents ";
            format_alt = " $icon $swap_used_percents ";
          }
          {
            block = "sound";
          }
          {
            block = "time";
            format = " $timestamp.datetime(f:'%a %d/%m %R') ";
            interval = 60;
          }
        ];
      };
    };
  };
}
