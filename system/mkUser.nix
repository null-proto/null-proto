{ config , pkgs , inputs , lib , ...}:
let 
  inherit (import ../users.nix) profile;
in
{
  users.users.${profile.username} = {
    shell = pkgs.fish;
    isNormalUser = true;
		home = profile.homeDir;
    description = profile.fullname;
		group = "wheel";
    extraGroups = [ "networkmanager" "video" "audio" "kvm" "disk" "adbusers" "docker" ];
    packages = [];
  };
}

