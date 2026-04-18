{
  waybarStyle = ''
@define-color base #303446;
@define-color mantle #292c3c;
@define-color crust #131624;

@define-color surface0 #363a4f;
@define-color surface1 #494d64;

@define-color red #f77274;
@define-color teal #71d8ce;
@define-color cyan #99d1db;
@define-color peach #ff9f46;
/* #0cf */
@define-color mauve #c6a0f6;
@define-color rosewater #f4dbd6;
@define-color lavender #b7bdf8;
@define-color sapphire #7dc4e4;
@define-color blue #6abdf4;
@define-color maroon #fe89a0;
@define-color pink #f5bde6;
@define-color sky #91d7e3;
@define-color yellow #fef40f;
@define-color olive #eee47f;

@define-color text #cdd6f4;


@define-color bg @crust;
@define-color fg @surface1;

@define-color fg_active @text;

@define-color border @base;
@define-color accent @base;
@define-color secondary @base;
@define-color alert @red;


* {
	font-family: VictorMono Nerd Font, sans-serif;
	font-size: 14.5px;
	font-weight: 600;
	margin: 0px 0px 0px 0px;
	padding: 0px 0px;
}


window#waybar {
	background-color: @crust;
	margin: 0px 0px 0px 0px;
}


/* workspaces */

#workspaces {
	color: @text;
	background-color: @bg;
}

#workspaces button {
	color: @fg;
	padding: 0px 4px 0px 4px;
	background-color: @bg;
}

#workspaces button:hover {
	border-bottom-width: 3px;
	border-bottom-color: @border;
	border-bottom-style: solid;
	border-radius: 0px;
}

#workspaces button.visible {
	color: @fg_active;
}

#workspaces button.focused {
	color: @fg_active;
}

#workspaces button.urgent {
	color: @alert;
}

#workspaces button.persistent {}

#workspaces button.empty {
	background-color: @crust;
}

#workspaces button.current_output {
	background-color: @crust;
}

#workspaces button:first-child {
	background-color: @crust;
}

#workspaces button:last-child {
	background-color: @crust;
}


/* window name  */

#window {}

#mode,
#privacy,
#tray,
#cpu,
#memory,
#temperature,
#wireplumber,
#network,
#bluetooth,
#backlight,
#battery,
#clock,
#mpris
{
	color: @text;
	background-color: @crust;
	padding: 0px 8px;
}

#mode,
#privacy,
#tray {
	border-radius: 6px;
	margin: 0px 0px 0px 6px;
	border-color: @border;
	border-style: solid;
	border-width: 3px;
}

#privacy {
	color: @peach;
}

/* player */


#mpris.paused {
	color: @fg;
}

/* network config */
#network.disabled,
#network.disconnected {
	color: @blue;
}

#network {
	color: @alert;
}

/* bluetooth config */

#bluetooth.off {
	color: @text;
}
#bluetooth.connected {
	color: @fg_active;
}

#bluetooth.disabled,
#bluetooth.on {
	color: @blue
}


/* battery  */

#battery.critical:not(.charging) {
	color: @alert
}


#battery.plugged {
	color: @text
}

#battery.charging {
	color: @accent
}

#battery.full {
	color: @fg
}

/* temperature */

#temperature {
	color: @text;
}

#temperature.warning {
	color: @yellow;
}

#temperature.critical {
	color: @alert;
}



#custom-label-temp,
#custom-label-audio,
#custom-label-backlight {
	color: @fg;
}

#backlight :hover {
	color: @fg_active;
}

#wireplumber.muted {
	color: @fg;
}

#wireplumber {
	color: @text;
}

/* tooltip */

tooltip {
	border: none;
	background-color: @crust;
	color: @text;
	padding: 4px;
}

/* custom */

#custom-sep {
	color: @border;
	background-color: @crust;
}
  '';
}
