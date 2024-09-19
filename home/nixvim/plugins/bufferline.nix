{ ... }:

{
  programs.nixvim = {
    keymaps = [
      {
        action = "<Cmd>BufferLineCycleNext<CR>";
        key = "<Tab>";
        mode = "n";
      }
      {
        action = "<Cmd>BufferLineCyclePrev<CR>";
        key = "<S-Tab>";
        mode = "n";
      }
      {
        action = "<Cmd>bw<CR>";
        key = "<leader>x";
        mode = "n";
      }
    ];
    plugins.bufferline = {
      enable = true;
    };
  };
}
