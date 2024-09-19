{ ... }:

{
  programs.nixvim = {
    plugins = {
      cmp-nvim-lsp.enable = true;

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
        ];
      };
    };
  };
}
