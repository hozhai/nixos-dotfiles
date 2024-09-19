{ ... }:

{
  programs.nixvim = {
    keymaps = [
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>ff";
        mode = "n";
      }
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>fg";
        mode = "n";
      }
      {
        action = "<cmd>Telescope buffers<CR>";
        key = "<leader>fb";
        mode = "n";
      }
      {
        action = "<cmd>Telescope help_tags<CR>";
        key = "<leader>fh";
        mode = "n";
      }
    ];
    plugins = {
      telescope = {
        enable = true;
      };
    };
  };
}
