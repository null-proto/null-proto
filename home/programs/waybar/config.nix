{ config , pkgs , ... }: {
	programs.waybar = {
		enable = true;

		settings = {
			mainBar = {
				position = "top"; # Waybar position (top|bottom|left|right)
				width = 1900; # Waybar width
				height = 26;
				margin-top = 12;

				# Choose the order of the modules
				modules-left = [
					"hyprland/workspaces"
					# "sway/mode";
					"privacy"
					"tray"
				];

				modules-center = [
					"clock"
				];

				modules-right = [
					"network"
					"temperature"
					"backlight"
					"wireplumber"
					"bluetooth"
					"battery"
				];

				"sway/workspaces" = {
					disable-scroll = true;
					sort-by-name = true;
					format = "{name}";
					format-window-separator = "";
				};

				"hyprland/workspaces" = {
					disable-scroll = true;
					sort-by-name = true;
					format = "{name}";
					format-window-separator = "";
				};

				"custom/sep" = {
					format = "/";
					tooltip = false;
				};

				tray = {
				icon-size = 18;
				spacing = 6;
				};

				"sway/mode" = {
					format = "{}";
					max-length = 8;
					tooltip = false;
				};

				"sway/window" = {
					format = "{title}";
					rewrite = " (.*) — (.*) = '$1', (.*) - (.*) = '$1', ";
					#     "(.*) — Mozilla Firefox": "󰈹  $1";
					#     "(.*) - YouTube — Zen Browser": "   $1";
					#     "(.*) - Google (.*) — Zen Browser": "$2   $1";
					#     "(.*) - Google — Zen Browser": "   $1";
					#     "(.*) - JupyterLab — Zen Browser": "   $1";
					#     "ChatGPT — Zen Browser": "󰚩  $1";
					#     "(.*) — Zen Browser": "󰬡  $1";
					#     "(.*) — Kdenlive": "   $1";
					#     "(.*) - VSCodium": "   $1";
					#     "(.*) - Inkscape": "   $1";
					#     "(.*) - Shotcut": "   $1";
					#     "(.*) - Blender (.*)": "   [$2] : $1";
					#"neovim (.*)": "   $1";
					#"nvim (.*)": "   $1";
					#"vim (.*)": "   $1";
					#"vi (.*)": "   $1";
					#"sudo (.*)" : "󱦚   $1";
					#"git (.*)" : "󰊢   $1";
					#"git pull (.*)" : "󰓂   $1";
					#"git fetch (.*)" : "   $1";
					#"git push (.*)" : "   $1";
					#"git merge (.*)" : "   $1";
					#"git lfs (.*)" : "   $1";
					#"gh (.*)" : "    $1";
					#"python (.*)" : "   : $1";
					#"IPython: (.*)" : "   : $1";
					#   };
					separate-outputs = true;
				};


				mpris = {
					format = " {title} ";
					status_icon = {
						default = "󰽴 ";
						playing = "󰽴 ";
						paused = "";
						stopped = "";
					};
					#"rewrite": {
					#	"(.*).(.*)": "$1";
					#};
					escape = true;
					# "interval": 5;
					tooltip = false;
					#"exec": "playerctl metadata --format='{{ title }}'";
					#"on-click": "playerctl play-pause";
					max-length = 50;
				};

				clock = {
					timezone = "Asia/Chennai";
					tooltip-format = "<tt>{calendar}</tt>";
					format-alt = "󰸗 {:%d/%m/%Y}";
					format = "{:%A %b %d %H:%M}";
				};

				backlight = {
					device = "nvidia_0";
					format = "{percent}:{icon}";
					format-icons = [ "󱩎" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨" ];
					on-scroll-up = "brightnessctl set 1+";
					on-scroll-down = "brightnessctl set 1-";
					tooltip-format = "Backlight";
				};

				battery = {
					states = {
						warning = 50;
						critical = 30;
					};
					format = "{icon}";
					format-charging = "󰂄";
					format-plugged = "󰚥";
					format-alt = "{icon} power:{power}";
					tooltip-format = "cap\t: {capacity}%\nest\t: {time}\npower\t: {power} watts\ncycles\t: {cycles}\nhealth\t: {health}%";
					format-icons = [ "󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
				};

				wireplumber = {
					# "scroll-step": 1; // %, can be a float
					format = "{volume}:{icon}";
					format-muted = "--:󰸈";
					format-icons = { default = [ "" "󱄠" ]; };
					on-click = "helvum";
				};

				# "custom/lock": {
				#     "tooltip": false;
				#     "on-click": "sh -c '(sleep 0.5s; swaylock --grace 0)' & disown";
				#     "format": "";
				# };
				# "custom/power": {
				#     "tooltip": false;
				#     "on-click": "wlogout &";
				#     "format": "襤"
				# };

				network = {
					# "interface": "wlp2*"; // (Optional) To force the use of this interface
					format-wifi = "󰯍 {bandwidthTotalBytes}";
					#"format-wifi": "{ifname}";
					format-ethernet = "󰯍 {bandwidthTotalBytes}";
					#"tooltip-format": "{ifname}\t{gwaddr}\nip\t{ipaddr}/{cidr}\nid\t{essid}\nsig 󰢾  {signalStrength} @ {frequency}Hz\n  {bandwidthUpBytes}\n  {bandwidthDownBytes}";
					tooltip-format = "{ifname}\t{gwaddr}\nip\t{ipaddr}/{cidr}\nid\t{essid}\nsig 󰢾  {signalStrength} @ {frequency}Hz";
					format-linked = "{ifname}";
					format-disconnected = "offline";
					interval = 1;
					format-alt = "{gwaddr}";
				};

				temperature = {
					thermal-zone = 2;
					# "hwmon-path": "/sys/class/hwmon/hwmon2/temp1_input";
					critical-threshold = 80;
					# "format-critical": "{temperatureC}°C {icon}";
					format = "{temperatureC}󰔄";
					format-icons = [ "" "" "" "" "" ];
					tooltip-format = "temperature {temperatureC}°C or {temperatureF}°F";
				};

				cpu = {
					format = "{usage}% {icon}";
					# "format-alt": " {usage}%";
					format-icons = [ "󰾆" "󰾅" "󰓅" ];
					tooltip = true;
				};

				memory = {
					format = "󰘚 {}%";
				};

				bluetooth = {
					format = "{status}";
					format-disabled = "";
					format-off = "";
					format-on = "";
					format-connected = "";
					format-connected-battery = "󰂱";
					# "format-device-preference": [ "device1"; "device2" ], // preference list deciding the displayed device
					tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
					tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
					tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
					tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\tBattery: {device_battery_percentage}%";
				};

				keyboard-state = {
					numlock = true;
					capslock = true;
					format = "{name} {icon}";
					format-icons = {
						locked = "";
						unlocked = "";
					};
				};

				privacy = {
					icon-spacing = 2;
					icon-size = 18;
					transition-duration = 250;
					modules = [
							{ type = "screenshare"; tooltip = true; tooltip-icon-size = 18; }
							{ type = "audio-out"; tooltip = true; tooltip-icon-size = 18; }
							{ type = "audio-in"; tooltip = true; tooltip-icon-size = 18; }
						];
				};
			};
		};

		style = (import ./style.nix).waybarStyle;
	};
}
