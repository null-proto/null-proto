{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    package =  pkgs.firefox;
  };

	programs.librewolf = {
		enable = true;
	};
}
