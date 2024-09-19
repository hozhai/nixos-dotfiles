{ ... }:

{
  programs.nixvim = {
    plugins = {
      gitsigns = {
        enable = true;
        settings = {
          signcolumn = true;
          signs = {
            add = {
              text = "│";
            };
            change = {
              text = "│";
            };
            changedelete = {
              text = "~";
            };
            delete = {
              text = "│";
            };
            topdelete = {
              text = "‾";
            };
            untracked = {
              text = "┆";
            };
          };
          watch_gitdir = {
            follow_files = true;
          };
        };
      };
    };
  };
}
