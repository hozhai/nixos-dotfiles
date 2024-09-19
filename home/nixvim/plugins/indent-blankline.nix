{...}: {
  programs.nixvim = {
    plugins = {
      indent-blankline = {
        enable = true;
        settings = {
          exclude = {
            buftypes = [
              "terminal"
              "quickfix"
            ];

            filetypes = [
              ""
              "dashboard"
              "checkhealth"
              "help"
              "lspinfo"
              "packer"
              "TelescopePrompt"
              "TelescopeResults"
            ];
          };

          indent = {
            char = "|";
          };

          scope = {
            show_end = false;
            show_start = false;
            show_exact_scope = true;
          };
        };
      };
    };
  };
}
