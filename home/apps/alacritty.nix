{
  pkgs,
  pkgs-stable,
  inputs,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 10;
          y = 10;
        };

        dynamic_padding = true;

        opacity = 0.9;
      };

      font = {
        normal = {
          family = "JuliaMono";
          style = "Regular";
        };

        size = 12;

        offset = {
          x = 0;
          y = 1;
        };
      };
    };
  };
}
