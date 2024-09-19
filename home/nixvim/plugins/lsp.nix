{...}: {
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        inlayHints = true;

        servers = {
          bashls = {
            enable = true;
          };
          clangd = {
            enable = true;
          };
          cssls = {
            enable = true;
          };
          jsonls = {
            enable = true;
          };
          lua-ls = {
            enable = true;
          };
          nixd = {
            enable = true;
          };
          pyright = {
            enable = true;
          };
          rust-analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
          tailwindcss = {
            enable = true;
          };
          tsserver = {
            enable = true;
          };
          yamlls = {
            enable = true;
          };
        };
      };
    };
  };
}
