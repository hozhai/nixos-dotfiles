{
  inputs,
  pkgs,
  pkgs-stable,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ./plugins/autoclose.nix
    ./plugins/barbacue.nix
    ./plugins/bufferline.nix
    ./plugins/conform.nix
    ./plugins/cmp.nix
    ./plugins/dressing.nix
    ./plugins/indent-blankline.nix
    ./plugins/gitsigns.nix
    ./plugins/lualine.nix
    ./plugins/lsp.nix
    ./plugins/mini.nix
    ./plugins/neo-tree.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
  ];

  home.packages = with pkgs; [
    alejandra
    black
    prettierd
    nodePackages.prettier
    stylua
    yamlfmt
    google-java-format
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    globals = {
      mapleader = " ";
      background = "dark";
    };

    opts = {
      encoding = "utf-8";
      fileencoding = "utf-8";

      number = true;
      cursorline = true;
      relativenumber = true;
      cursorlineopt = "line";

      spell = false;

      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      breakindent = true;
      smartindent = true;
      autoindent = true;

      swapfile = false;
      termguicolors = true;
      wrap = false;

      mouse = "";
    };

    clipboard.providers.wl-copy.enable = true;

    keymaps = [
      {
        action = "<Cmd>wincmd k<CR>";
        key = "<C-k>";
        mode = "n";
        options = {
          silent = true;
        };
      }
      {
        action = "<Cmd>wincmd j<CR>";
        key = "<C-j>";
        mode = "n";
        options = {
          silent = true;
        };
      }
      {
        action = "<Cmd>wincmd h<CR>";
        key = "<C-h>";
        mode = "n";
        options = {
          silent = true;
        };
      }
      {
        action = "<Cmd>wincmd l<CR>";
        key = "<C-l>";
        mode = "n";
        options = {
          silent = true;
        };
      }
      {
        key = ";";
        action = ":";
      }
    ];

    colorschemes.catppuccin.enable = true;

    diagnostics = {
      virtual_text = true;
      virtual_lines.only_current_line = true;
    };
  };
}
