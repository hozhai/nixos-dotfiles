{ pkgs, pkgs-stable, inputs, ... }: {
   programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza --icons -aa";
      l = "eza --icons -aalh";
      lg = "lazygit";
      v = "nvim";
      vim = "nvim";
      svim = "sudo nvim";
      rebuild = "/home/zhai/.config/nixos/rebuild.sh";
    };
    interactiveShellInit = ''
      function fish_greeting
      end

      function vide
          nohup /home/zhai/.config/nixos/home/fish/neovide.sh > /dev/null 2>&1 &
          disown
      end
     '';
    plugins = [
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      {
        name = "z";
        src = pkgs.fishPlugins.z.src;
      }
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
    ];
  };
}
