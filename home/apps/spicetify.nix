{
  pkgs,
  pkgs-stable,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;
    theme = spicePkgs.themes.defaultDynamic;
    spotifyPackage = pkgs.spotify;

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      shuffle
      adblock
      volumePercentage
      beautifulLyrics
    ];

    enabledCustomApps = with spicePkgs.apps; [
      ncsVisualizer
    ];
  };
}
