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
          family = "Operator Mono";
          style = "Medium";
        };

        size = 13.5;

        offset = {
          x = 0;
          y = 1;
        };
      };
    };
  };
}
