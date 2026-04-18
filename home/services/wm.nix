{ pkgs, ... } :{

	# systemd.user.services.wm-session = {
	# 	Unit = {
	# 		Description = "Window Manager Session";
	# 		# Notice the Capitalization here, it matches systemd's exact keys
	#
	# 		BindsTo = [ "basic.target" ];
	# 		After = [ "basic.target" ];
	# 	};
	#
	# 	Service = {
	# 		Type = "simple";
	#
	# 		ExecStart = "bash -c 'echo run > ~/run && exec ${pkgs.hyprland}/bin/start-hyprland'"; 
	#
	# 		StandardInput = "tty";
	# 		StandardOutput = "tty";
	# 		StandardError = "journal";
	# 		TTYReset = true;
	# 		TTYVHangup = true;
	# 		TTYVTDisallocate = true;
	#
	# 		# TTY Takeover settings
	# 		# StandardInput = "tty";
	# 		# StandardOutput = "journal";
	# 		# StandardError = "journal";
	# 		# TTYPath = "/dev/tty1";
	# 		# TTYReset = true;
	# 		# TTYVHangup = true;
	# 		# TTYVTDisallocate = true;
	#
	# 		Restart = "on-failure";
	# 		RestartSec = "2";
	# 	};
	#
	# 	Install = {
	# 		WantedBy = [ "default.target" ];
	# 	};
	# };
}
