{ pkgs , ... }: {
	programs.rofi = {
		enable = true;
		package = pkgs.rofi-wayland.override { plugins= [ pkgs.rofi-emoji pkgs.rofi-calc ];};
	};
}
