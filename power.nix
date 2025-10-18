{ pkgs ,... }:
{
	powerManagement = {
		enable = true;
		powertop.enable = true;
	};

	services.power-profiles-daemon = {
		enable = true;
		package = pkgs.power-profiles-daemon;
	};
}
