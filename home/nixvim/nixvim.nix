{ inputs, pkgs, pkgs-stable, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorschemes.catppuccin.enable = true;
    diagnostics = {
      virtual_text = true;
      virtual_lines.only_current_line = true;
    }

    plugins = {
      lualine.enable = true;
      autoclose.enable = true;
      barbecue.enable = true;
      bufferline = {
        enable = true;
	iconsPackage = pkgs.vimPlugins.nvim-web-devicons;
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
	settings.sources = [
	  { name = "nvim_lsp"; }
	  { name = "path"; }
	  { name = "buffer"; }
	];
      };
      cmp-nvim-lsp.enable = true;
      cursorline.enable = true;
      gitsigns.enable = true;
      indent-blankline.enable = true;
      lsp = {
        enable = true;
	inlayHints = true;
      };
      nix.enable = true;
      nvim-tree.enable = true;
      treesitter = {
        enable = true;
	settings = {
	  auto_install = true;
	};
      };
    };
  };
}
