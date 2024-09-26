{
  config,
  pkgs,
  pkgs-stable,
  inputs,
  ...
}: {
  imports = [
    ./nixvim/nixvim.nix
    ./gnome/gnome.nix
    ./apps/spicetify.nix
    ./apps/vscode.nix
  ];

  home.username = "zhai";
  home.homeDirectory = "/home/zhai";

  home.packages = with pkgs; [
    fastfetch
    yazi

    zip
    xz
    unzip
    p7zip

    ripgrep
    jq
    yq-go
    eza
    fzf

    mtr
    iperf3
    dnsutils
    ldns
    aria2
    socat
    nmap
    ipcalc

    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    nix-output-monitor

    btop
    iotop
    iftop

    strace
    ltrace
    lsof
    sysstat
    lm_sensors
    ethtool
    pciutils
    usbutils

    nodePackages.vercel

    grc

    floorp
    vesktop
    gh
    lazygit
    # spotify # see spicetify.nix
    gnome-tweaks
    dconf-editor
    blackbox-terminal
    qbittorrent
  ];

  home.file.".local/share/blackbox/schemes/catppuccin-mocha.json".source = ./assets/catppuccin-mocha-tilix.json;
  home.file.".config/vesktop/settings/settings.json".source = ./assets/vesktop.json;

  programs.git = {
    enable = true;
    userName = "hozhai";
    userEmail = "zhaihongmeng@gmail.com";
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      function fish_greeting

      end

      alias vim="nvim";
      alias svim="sudo nvim";

      alias ls="eza --icons -aa"
      alias l="eza --icons -aalh"

      alias lg="lazygit"

      alias rebuild="/home/zhai/.config/nixos/rebuild.sh"
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

  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
