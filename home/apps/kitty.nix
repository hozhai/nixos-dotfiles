{
  pkgs,
  inputs,
  ...
}: {
  programs.kitty = {
    enable = true;
    font.name = "Operator Mono";
    font.size = 13;
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      window_padding_width = 5;
      background_opacity = "0.8";
    };
  };
}
