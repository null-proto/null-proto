
{ config , pkgs , ... }: {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
				position= "bottom";
				width= 1920;
				height= 28;
				margin-top= 0;

				"modules-left" = [
					"clock"
					"custom/sep"
					"hyprland/workspaces"
					"custom/sep"
					"tray"
					"mpris"
				];

				"modules-right" = [
					"network"
					"custom/sep"
					"memory"
					"custom/sep"
					"custom/label-temp"
					"temperature"
					"custom/sep"
					"custom/label-backlight"
					"backlight"
					"custom/sep"
					"custom/label-audio"
					"wireplumber"
					"custom/sep"
					"bluetooth"
					"custom/sep"
					"battery"
				];

				"sway/workspaces"= {
					"disable-scroll"= true;
					"sort-by-name"= true;
					"format"= "{name}";
					"format-window-separator"= "";
				};

				"hyprland/workspaces"= {
					"disable-scroll"= true;
					"sort-by-name"= true;
					"format"= "{name}";
					"format-window-separator"= "";
				};

				"custom/sep"= {
					"format"= "|";
					"tooltip"= false;
				};

				"custom/label-temp"= {
					"format" = " temp";
					"tooltip" = false;
				};

				"custom/label-backlight"= {
					"format" = " backlight";
					"tooltip" = false;
				};

				"custom/label-audio"= {
					"format" = " audio";
					"tooltip" = false;
				};

				"tray"= {
					"icon-size" = 18;
					"spacing" = 6;
				};

				"sway/mode"= {
					"format" = "{}";
					"max-length" = 8;
					"tooltip" = false;
				};

				"mpris"= {
					"format" = "{status_icon} {title}";
					"format-paused" = "{status_icon} <i>{title}</i>";
					"status_icon" = {
						"default" = "󰽴 ";
						"playing" = "󰽴 ";
						"paused" = "";
						"stopped" = "";
					};
					"ellipsis" ="~";
					"escape" = true;
					"tooltip" = false;
					"max-length" = 50;
					"exec" = "playerctl metadata --format='{{ title }}'";
					"on-click" = "playerctl play-pause";
				};

				"clock"= {
					"tooltip-format" = "<tt>{calendar}</tt>";
					"format-alt" = "󰸗 {:%d/%m/%Y}";
					"format" = "{:^%a %h %r}";
					"interval" = 1;
				};

				"backlight"= {
					"device" = "nvidia_0";
					"format" = "{percent}%";
					"on-scroll-up" = "brightnessctl set 1+ > /dev/null";
					"on-scroll-down" = "brightnessctl set 1- > /dev/null";
					"tooltip-format" = "Backlight";
				};

				"battery"= {
					"states" = {
						"warning" = 50;
						"critical" = 30;
					};

					"format" = "{icon}";
					"format-charging" = "󰂄";
					"format-plugged" = "plugged 󰚥";
					"format-alt" = "bat {capacity}%";
					"tooltip-format" = "cap\t: {capacity}%\nest\t: {time}\npower\t: {power} watts\ncycles\t: {cycles}\nhealth\t: {health}%";
					"format-icons" = [
						"CRITICAL"
						"󰂃"
						"󰁺"
						"󰁻"
						"󰁼"
						"󰁽"
						"󰁾"
						"󰁿"
						"󰂀"
						"󰂁"
						"󰂂"
						"full"
					];
				};

				wireplumber= {

					"format" = "{volume}%";
					"format-muted" = "muted";
					"format-icons" = {
						"default" = [
						];
					};
					"on-click" = "crosspipe";
				};
				network= {
					"format-wifi" = "{ifname}: {ipaddr}";
					"format-ethernet" = "{ifname}: {ipaddr}";
					"tooltip-format" = "{ifname}\t{gwaddr}\nip\t{ipaddr}/{cidr}\nid\t{essid}\nsig 󰢾  {signalStrength} @ {frequency}Hz";
					"format-linked" = "{ifname}";
					"format-disconnected" = "offline";
					"interval" = 1;
					"format-alt" = "{gwaddr}";
				};

				temperature= {
					"thermal-zone" = 2;
					"critical-threshold" = 80;
					"format" = "{temperatureC}󰔄";
					"tooltip-format" = "{temperatureF}°F";
				};

				memory= {
					"format" = "{used:0.2f}G + {swapUsed:0.2f}G used";
					"format-alt" = "{avail:0.2f}G + {swapAvail:0.2f}G left";
					"tooltip" = false;
				};

				bluetooth= {
					"format" = "{status}";
					"format-disabled" = "bt-discreat";
					"format-off" = "bt-off";
					"format-on" = "bt-standby";
					"format-connected" = "bt";
					"format-connected-battery" = "bt";

					"tooltip-format" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
					"tooltip-format-connected" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
					"tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
					"tooltip-format-enumerate-connected-battery" = "{device_alias}\t{device_address}\tBattery: {device_battery_percentage}%";
				};

				"keyboard-state"= {
					"numlock" = true;
					"capslock" = true;
					"format" = "{name} {icon}";
					"format-icons" = {
						"locked" = "lock";
						"unlocked" = "unlock";
					};
				};
				privacy= {
					"icon-spacing" = 2;
					"icon-size" = 18;
					"transition-duration" = 250;
					"modules" = [
						{
							"type" = "screenshare";
							"tooltip" = true;
							"tooltip-icon-size" = 18;
						}
						{
							"type" = "audio-out";
							"tooltip" = true;
							"tooltip-icon-size" = 18;
						}
						{
							"type" = "audio-in";
							"tooltip" = true;
							"tooltip-icon-size" = 18;
						}
					];
				};
			};
		};
    style = (import ./style.nix).waybarStyle;
	};
}
