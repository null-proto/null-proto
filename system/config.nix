{ ... }:
{
  imports = [
		./environment.nix
    ./security.nix
    ./locale.nix
    ./user.nix
    ./time.nix
    ./network.nix
    ./services.nix
    ./systemd.nix

    ./virtualization.nix

    ./manuals.nix

    ./programs/utils.nix
  ];
}
