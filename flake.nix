# {
#   inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
#   inputs.home-manager.url = "github:nix-community/home-manager";
#
#   outputs = { self, nixpkgs, ... }@attrs: {
#     nixosConfigurations.fnord = nixpkgs.lib.nixosSystem {
#       system = "x86_64-linux";
#       specialArgs = attrs;
#       modules = [ ./configuration.nix ];
#     };
#   };
# }


{
  description = "NixOS configuration";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    # nur = { url = "github:nix-community/NUR"; };
		home-manager = { url = "github:nix-community/home-manager/"; };
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
