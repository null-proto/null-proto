{ pkgs , lib ,... }:
let
inherit (import ../users.nix) profile;
in
{
	user = {
		shell = "${pkgs.fish}/bin/fish";
		userName = lib.mkForce profile.username;
	};

   # ./programs/extra.nix
  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "25.11"; # check arbitrary files or let generate new

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Set your time zone
  time.timeZone = "Asia/kolkat";
}
