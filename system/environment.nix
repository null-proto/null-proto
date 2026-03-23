{ pkgs , ... }: {

	# annoying
	xdg.sounds.enable = false;

  environment = {
		plasma6.excludePackages = with pkgs.kdePackages; [
		  ark
			akonadi-calendar
			akonadiconsole
			akonadi-contacts

			breeze-plymouth

			calligra
			okular

			
			dragon
			discover

			gwenview
		];

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
			# zfs
			# zfstools
			# qemu
			wl-clipboard
			man-pages
			man-db
			man
		];
	};
}
