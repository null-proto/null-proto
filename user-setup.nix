{ profile }:
{ config , pkgs , inputs , lib , ...}:
let 
in
{
  users.users.${profile.username} = {
    shell = pkgs.fish;
    isNormalUser = true;
		home = profile.homeDir;
    description = profile.fullname;
		group = "wheel";
    extraGroups = [ "networkmanager" "video" "audio" "kvm" "disk" "adbusers" "docker" ];
    packages = with pkgs; [];
  };

	imports = [
		(import ./home-manager.nix { profile = profile; })
	];
}

