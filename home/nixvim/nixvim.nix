{ pkgs, pkgs-stable, ... }:

{
  imports = [
    nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;
  };
}
