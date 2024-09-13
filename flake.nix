{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { nixpkgs, nixpkgs-stable, home-manager, ...}: {
    nixosConfigurations = {
      # PC
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
            inherit inputs;
            pkgs-stable = import nixpkgs-stable {
                system = "x86_64-linux";
                config.allowUnfree = true;
            };
        };
	modules = [
	  ./hosts/nixos-pc/configuration.nix

	  home-manager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.zhai = import ./home/home.nix;
	    home-manager.extraSpecialArgs.inputs = inputs;
	  }
	];
      };
    };
  };
}
