{ catppuccin , ... } :{

	imports = [
	  catppuccin.homeModules.catppuccin
	];

	catppuccin = {
		accent = "blue";
		enable = false;
		flavor = "mocha";

		bat.enable = true;
		btop.enable = true;
	};
}
