{ ... }:

{
  programs.nixvim = {
    keymaps = [
      {
        action = "<Cmd>NvimTreeToggle<CR>";
        key = "<C-n>";
        mode = "n";
      }
    ];

    plugins = {
      nvim-tree = {
        enable = true;
        hijackCursor = true;
        extraOptions = {
          view = {
            side = "right";
          };
        };
      };

      dressing.enable = true;
    };
  };
}
