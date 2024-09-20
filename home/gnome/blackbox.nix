{
  pkgs,
  pkgs-stable,
  ...
}: {
  dconf = {
    settings = {
      "com/raggesilver/BlackBox" = {
        font = "JuliaMono 12";
        command-as-login-shell = true;
        cursor-shape = 0;
        headerbar-drag-area = true;
        opacity = 100;
        pretty = true;
        scrollback-lines = 8192;
        style-preference = 2;
        theme-dark = "Catppuccin Mocha";
        working-directory-mode = 1;
      };
    };
  };
}
