{
  pkgs,
  pkgs-stable,
  ...
}: {
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        action = "<Cmd>Neotree filesystem reveal right toggle<CR>";
        key = "<C-n>";
      }
    ];
    plugins = {
      neo-tree = {
        enable = true;
        filesystem = {
          filteredItems = {
            visible = true;
            showHiddenCount = true;
            hideDotfiles = false;
            hideGitignored = false;
          };
        };
      };
    };
  };
}
