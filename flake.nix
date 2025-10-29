{
  description = "System derivations";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-25.05"; };
    home-manager = { url = "github:nix-community/home-manager/release-25.05"; };
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs , home-manager, ...}@attr:
  let 
    inherit (import ./users.nix) profile;
  in
  {
    nixosConfigurations = {
      nix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.backupFileExtension = "backup";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${profile.username} = ./home/config.nix ;
          }
        ];
        specialArgs = attr;
      };
    };
  };
}
