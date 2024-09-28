{
  config,
  pkgs,
  pkgs-stable,
  inputs,
  ...
}: {
  imports = [
    ./gnome/gnome.nix
    ./apps/spicetify.nix
    ./apps/vscode.nix
    ./apps/alacritty.nix
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

    inputs.zen-browser.packages."x86_64-linux".default
    inputs.Neve.packages.${pkgs.system}.default
    statix
    vesktop
    gh
    lazygit
    gnome-tweaks
    dconf-editor
    qbittorrent
    nodePackages.vercel
    grc
  ];

  home.file.".config/vesktop/settings/settings.json".source = ./assets/vesktop.json;
  home.file.".face".source = ./assets/profile.png;

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
