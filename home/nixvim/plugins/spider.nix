{
  pkgs,
  pkgs-stable,
  ...
}: {
  programs.nixvim = {
    plugins = {
      spider.enable = true;
    };
  };
}
