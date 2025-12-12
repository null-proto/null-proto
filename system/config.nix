{ ... }:
{
  imports = [
    ./security.nix
    ./locale.nix
    ./user.nix
    ./time.nix
    ./network.nix
    ./services.nix
    ./systemd.nix

    ./programs/utils.nix
    ./programs/extra.nix
  ];
}
