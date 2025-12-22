{ pkgs , ... }: {
  environment.systemPackages = with pkgs; [
	  qemu
	  wl-clipboard
		man-pages
		man-db
		man
	];
}
