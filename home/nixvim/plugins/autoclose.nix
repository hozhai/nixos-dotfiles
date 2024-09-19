{ pkgs, pkgs-stable, ... }:

{
    programs.nixvim = {
            extraPlugins = with pkgs.vimPlugins; [
                lexima-vim
            ];

            plugins = {
                    ts-autotag = {
                            enable = true;
                        };
                };

        };
}
