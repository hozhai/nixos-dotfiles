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
    ./fish/fish.nix
  ];

  home = {
    username = "zhai";
    homeDirectory = "/home/zhai";

    packages = with pkgs; [
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

      # Formatters
      nodePackages.prettier
      prettierd
      google-java-format
      black
      alejandra
      rustfmt
      statix
      selene
      python312Packages.flake8
      eslint
      eslint_d
      nodePackages.jsonlint
      checkstyle

      # User Apps
      inputs.zen-browser.packages."x86_64-linux".default
      inputs.Neve.packages.${pkgs.system}.default
      vesktop
      gh
      lazygit
      gnome-tweaks
      dconf-editor
      qbittorrent
      nodePackages.vercel
      grc
      neovide
    ];

    file.".config/vesktop/settings/settings.json".source = ./assets/vesktop.json;
    file.".face".source = ./assets/profile.png;
  };

  programs = {
    git = {
      enable = true;
      userName = "hozhai";
      userEmail = "zhaihongmeng@gmail.com";
    };

    home-manager.enable = true;
  };

  home.stateVersion = "24.05";
}
