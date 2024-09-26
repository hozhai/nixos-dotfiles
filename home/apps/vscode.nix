{
  pkgs,
  pkgs-stable,
  inputs,
  ...
}: {
  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      esbenp.prettier-vscode
      yoavbls.pretty-ts-errors
      aaron-bond.better-comments
      usernamehw.errorlens
      vscodevim.vim
      github.copilot
      github.copilot-chat
      ms-vscode.cpptools-extension-pack
      ms-vscode.cpptools
      ms-python.python
      ms-python.vscode-pylance
      rust-lang.rust-analyzer
      kamadorueda.alejandra
      jeff-hykin.better-nix-syntax
      jnoortheen.nix-ide
      redhat.java
      vscjava.vscode-java-pack
      biomejs.biome
    ];
  };
}
