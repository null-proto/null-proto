{ pkgs, ... } :{
	systemd.user.services.wm-session = {
		description = "Window Manager Session";
		
		# Start automatically when the systemd user instance boots (on auto-login)
		wantedBy = [ "default.target" ];
		
		# Ensure it only tries to run when tty1 is active and available
		bindsTo = [ "dev-tty1.device" ];
		after = [ "dev-tty1.device" ];

		serviceConfig = {
			Type = "simple";
			
			ExecStart = "${pkgs.hyprland}/bin/start-hyprland"; 
			
			# --- CRUCIAL TTY TAKEOVER SETTINGS ---
			# These settings grant the systemd user service the permissions 
			# it needs to act as a graphical session on the TTY.
			StandardInput = "tty";
			StandardOutput = "journal";
			StandardError = "journal";
			TTYPath = "/dev/tty1";
			TTYReset = true;
			TTYVHangup = true;
			TTYVTDisallocate = true;
			
			# (Optional) Automatically restart if it crashes
			Restart = "on-failure";
			RestartSec = "2";
		};
	};
}
