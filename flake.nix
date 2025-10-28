{
  description = "NixOS configuration";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-25.05"; };
		home-manager = { url = "github:nix-community/home-manager/release-25.05"; };
  };

  outputs = { nixpkgs , ...}@attr:
  {
    nixosConfigurations = {
      nix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
        ];
        specialArgs = attr;
      };
    };
  };
}
