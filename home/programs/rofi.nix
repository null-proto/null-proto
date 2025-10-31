{ pkgs , ... }: {
	programs.rofi = {
		enable = true;
		package = pkgs.rofi-wayland.override { plugins= [ pkgs.rofi-emoji pkgs.rofi-calc ];};
		theme = "blackglass";

		extraConfig = {
			modi = "drun,run,window,calc,emoji,combi";
			show-icons = true;
			terminal = "kitty";
			# drun-display-format = "{name}";
		};
	};
}
