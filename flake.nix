{
  description = "System derivations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix/main";

	  swww.url = "github:null-proto/swww";

		agenix.url = "github:ryantm/agenix";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvim-config = {
      url = "git+https://github.com/null-proto/nvim";
      flake = false;
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/testing";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

		wallpaper = {
			url = "tarball+https://drive.usercontent.google.com/download?id=1WeWnU1OT6wJRA03q6LD0RJCrdjR_mrwm&export=download";
			flake = false;
			# type = "tar";
			# sha256 = "sha25-9854ccd135b26840d16df63a928a5170dc5c68e7524e71a0ed2fc47b64162abf";
		};

    # quickshell
		# caelestia = {
		#     url = "github:caelestia-dots/shell";
		#     inputs.nixpkgs.follows = "nixpkgs";
		#   };

  };
  outputs = { nixpkgs , catppuccin , home-manager , nix-on-droid, agenix, ...}@inputs:
  let
    inherit (import ./users.nix) profile;

  in
  {
    nixosConfigurations = {
      nix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;

        modules = [
				  agenix.nixosModules.default
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
            home-manager.backupFileExtension = ".old";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.${profile.username} = {
              imports = [
                ./home/config.nix

                catppuccin.homeModules.catppuccin {
                  imports = [ ./home/colors/mocha.nix ];
                }

								# caelestia.homeManagerModules.default
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
