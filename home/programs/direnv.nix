{ config , pkgs , ... }:{
	programs.direnv = {
		enable = true;
		enableBashIntegration = false;
		# enableFishIntegration = true;
	};
}
