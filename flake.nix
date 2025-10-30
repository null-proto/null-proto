{
  description = "System derivations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
		catppuccin.url = "github:catppuccin/nix/release-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs , home-manager, catppuccin , ...}@attr:
  let 
    inherit (import ./users.nix) profile;
  in
  {
    nixosConfigurations = {
      nix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./config.nix
          ./machine/config.nix
          ./system/config.nix
          ./system/locale.nix
          ./system/user.nix
					catppuccin.nixosModules.catppuccin

          home-manager.nixosModules.home-manager {
            home-manager.backupFileExtension = "backup";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${profile.username} = {
							imports = [
							  ./home/config.nix
								catppuccin.homeModules.catppuccin
							];
						};
          }
        ];
        specialArgs = attr;
      };
    };
  };
}
