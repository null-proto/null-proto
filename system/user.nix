{ pkgs ,... }:
let 
  inherit (import ../secrets.nix) profile;
in
{
	users = {
		mutableUsers = false;

# some groups cannot work this for [`docker`] and [`adbusers`] group
# use [`members`]
		users.${profile.username} = {
			shell = pkgs.fish;
			isNormalUser = true;
			linger = true;
			home = profile.homeDir;
			description = profile.fullname;

			hashedPassword = profile.hash;
			group = "wheel";

			extraGroups = [ "networkmanager" "video" "audio" "kvm" "disk" "input" ];
			packages = [];
		};

		users.root.hashedPassword = profile.rootHash;

# # members
# these groups are equalent to root
		# extraGroups.docker.members = [ profile.username ];
		# extraGroups.adbusers.members = [ profile.username ];
	  groups = {
			docker.members = [ profile.username ];
		  adbusers.members = [ profile.username ];
		  libvirtd.members = [ profile.username ];
		};
	};
}

