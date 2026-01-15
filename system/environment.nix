{ pkgs , ... }: {

  environment = {
		pathsToLink = [ 
			"/share/doc"
			"/share/applications"
			"/share/xdg-desktop-portal"
		];

	  variables = {
			EDITOR = "nvim";
			VISUAL = "nvim";
			PAGER = "less";
		};

    systemPackages = with pkgs; [
			zfs
			zfstools
			# qemu
			wl-clipboard
			man-pages
			man-db
			man
		];
	};
}
