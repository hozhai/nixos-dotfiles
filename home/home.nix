{
  config,
  pkgs,
  pkgs-stable,
  inputs,
  ...
}: {
  imports = [
    ./apps/spicetify.nix
    ./apps/vscode.nix
    ./apps/kitty.nix
    ./fish/fish.nix
    ./sway/sway.nix
  ];

  home = {
    username = "zhai";
    homeDirectory = "/home/zhai";

    pointerCursor = {
      gtk.enable = true;
      package = pkgs.posy-cursors;
      name = "Posy_Cursor_Black";
      size = 24;
    };

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
      dconf-editor
      qbittorrent
      nodePackages.vercel
      grc
      neovide
      bruno
      bat
      dolphin
    ];

    file.".config/vesktop/settings/settings.json".source = ./assets/vesktop.json;
    file."Pictures/wallpaper.jpg".source = ./assets/wallpaper.jpg;
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
