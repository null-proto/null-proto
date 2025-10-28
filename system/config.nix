{ pkgs ,...}:
{
  services = {
		speechd.enable = false;
		orca.enable = false;
		ntp.enable = false;
		timesyncd.enable = true;
		# nscd.package = pkgs.glibc;
		

    greetd = {
      enable = true;
      settings = {
      	default_session = let tuigreet = "${pkgs.tuigreet}/bin/tuigreet"; in {
					command = "${tuigreet} --time --remember --remember-session --sessions ${pkgs.hyprland}/share/wayland-session";
          session = "${pkgs.hyprland}/share/wayland-session";
					user = "greeter";
        };
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      extraConfig.pipewire = {};
    };

    # blueman = { enable = true; };

    xserver = { videoDrivers = [ "nvidia" ]; };

    keyd = {
      enable = true;
			keyboards = {
				default = {
					ids = [ "*" ];
					settings = {
						main = {
							capslock = "overload(control,esc)";
							esc = "capslock";
						};
					otherlayer = {};
					}; # extraConfig = '''';
				};
			};
    };

		# polkit.extraConfig = ''
		# 	/* Allow local users to mount system disks */
		# 	polkit.addRule(function(action, subject) {
		# 		if ( subject.local && action.id == "org.freedesktop.udisks2.filesystem-mount-system") {
		# 			return polkit.Result.YES;
		# 		}
		# });
		# '';
	};

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

	# systemd.user.services.hyprland = {
	# 	description = "Hyprland Wayland session";
	# 	after = [ "graphical.target" ];
	# 	serviceConfig.ExecStart = "${pkgs.hyprland}/bin/Hyprland";
	# 	wantedBy = [ "default.target" ];
	# 	enable = true;
	# };

  
  networking = {
    hostName = "nix";
    networkmanager.enable = true;
  };

  time = {
	  hardwareClockInLocalTime = false;
		timeZone = "Asia/Kolkata";
	};
  
  security = {
    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };

    rtkit.enable = true;
  };
  
  programs = {
		neovim = {
			enable = true;
			defaultEditor = true;
		};
    fish.enable = true;
    adb.enable = true;
		ssh.startAgent = true;
		tmux = {
			enable = true;
			extraConfig = (import ./tmux.nix).config;
		};

  #   hyprland = {
  #     enable = true;
  #     xwayland.enable = false;
  #   };
  };

  environment.systemPackages = with pkgs; [
	  tcpdump
		arping
		netcat

    acpi brightnessctl

    htop btop atop
    
    dfrs gdu
    
    ripgrep tree fzf
    
    openssh wget curl binutils

		docker openssh openssl

		usbutils binutils libinput coreutils-full lsof

		curl nmap nettools iputils

		nixd
		git
		git-lfs
		dconf

		unzip 
		gzip 
		unrar
		xz
		lz4

		btrfs-progs btrfs-heatmap 

		ffmpeg

#-- un-free & sus
		_7zz
		unrar

		android-studio
		firefox
		obs-studio
		blender
  ];
}
