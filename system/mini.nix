{pkgs, ...} :
{
	imports = [
	  ./manuals.nix
		./network.nix
		./security.nix
		./user.nix
	];


	xdg.sounds.enable = false;

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
			man-pages
			man-db
			man
		];
	};

}
