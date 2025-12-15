{
  description = "System derivations";

  inputs = {
    rolling.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    catppuccin.url = "github:catppuccin/nix/release-25.05";

    home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

    nvim-config = {
      url = "github:null-proto/nvim";
      flake = false;
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/testing";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { nixpkgs , catppuccin , home-manager , nix-on-droid, ...}@inputs:
  let 
    inherit (import ./users.nix) profile;
  in
  {
    nixosConfigurations = {
      nix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;

        modules = [
          ./config.nix
          ./host/config.nix
          ./system/config.nix

          catppuccin.nixosModules.catppuccin {
            catppuccin.enable = false;
            catppuccin.flavor = "mocha";
            catppuccin.accent = "yellow";
            catppuccin.tty.enable = true;
          }

          home-manager.nixosModules.home-manager {
            home-manager.backupFileExtension = ".backup";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.${profile.username} = {
              imports = [
                ./home/config.nix

                catppuccin.homeModules.catppuccin {
                  imports = [ ./home/colors/mocha.nix ];
                }
              ];
            };
          }
        ];
      };
    };

    nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
      pkgs = import nixpkgs { system = "aarch64-linux"; };

			extraSpecialArgs = {
				inherit inputs;
			};


      modules = [
			  ./nod.nix
			];

    };
  };
}
