{ config, pkgs, pkgs-stable, inputs, ... }:

{
  imports = [
    ./nixvim/nixvim.nix
    ./gnome/gnome.nix
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

    grc

    floorp
    vesktop
    gh
    lazygit
    spotify
    gnome-tweaks
  ];

  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()

      config.use_fancy_tab_bar = false
      config.font = wezterm.font_with_fallback {
        'Julia Mono',
        'Symbols Nerd Font'
      }
      config.color_scheme = "Catppuccin Mocha"
      config.front_end = "WebGpu"

      return config
    '';
  };

  programs.git = {
    enable = true;
    userName = "hozhai";
    userEmail = "zhaihongmeng@gmail.com";
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      function fish_greeting
	# todo
      end

      alias vim="nvim";
      alias svim="sudo nvim";

      alias ls="eza --icons -aa"
      alias l="eza --icons -aalh"

      alias rebuild="/home/zhai/.nixos-config/rebuild.fish"
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
