{
	waybarStyle = ''
@define-color base			#303446;
@define-color mantle		#292c3c;
/* @define-color crust			#232634; */
@define-color crust			#131624;

@define-color surface0	#363a4f;
@define-color surface1	#494d64;

@define-color red				#f77274;
@define-color teal      #71d8ce;
@define-color cyan      #99d1db;
@define-color peach     #ff9f46;/* #0cf */
@define-color mauve     #c6a0f6;
@define-color rosewater #f4dbd6;
@define-color lavender  #b7bdf8;
@define-color sapphire  #7dc4e4;
@define-color blue		  #6abdf4;
@define-color maroon		#fe89a0;
@define-color pink      #f5bde6;
@define-color sky       #91d7e3;
@define-color yellow    #fef40f;
@define-color olive     #eee47f;

@define-color text      #efefef;
@define-color text1     #afafaf;


* {
	font-family: JetBrainsMono Nerd Font, sans-serif;
	font-size: 14.5px;
	font-weight: 600;
	margin: 0px 0px 0px 0px;
 	padding : 0px 0px;
}

window#waybar {
	background-color: rgba(0,0,0,0);
	margin : 0px 8px 0px 0px;
}


/* workspaces */

#workspaces {
	font-family: JetBrains Mono, sans-serif;
	font-size: 14.5px;
	font-weight: 600;
	padding: 0px 4px;
	background-color: @crust;
	border-radius: 2px;
}

#workspaces button {
	font-family: JetBrains Mono, sans-serif;
	border-color: @crust;
	font-size: 14.5px;
	font-weight: 600;
	padding: 0px 4px;
	margin: 0px;
}

#workspaces button.visible {
	color : @red;
}

#workspaces button.focused {
	color : @red;
}

#workspaces button.urgent {
	color : @blue;
}

#workspaces button.persistent {
	background-color: @crust;
	border-color: @crust;
	font-size : 12px;
	font-weight: 600;
}

#workspaces button.empty {
	background-color: @crust;
	border-color: @crust;
	font-size : 12px;
	font-weight: 600;
	margin: 0px;
}

#workspaces button.current_output {
	background-color: @crust;
	border-color: @crust;
	font-size : 12px;
	font-weight: 600;
	margin: 0px;
}

#workspaces button:first-child {
	background-color: @crust;
	font-size : 12px;
	font-weight: 600;
	margin: 0px;
}

#workspaces button:last-child {
	background-color: @crust;
	font-size : 12px;
	font-weight: 600;
	margin: 0px;
}


/* window name  */

#window {
}

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
#clock {
	background-color: @crust;
	padding: 0px 8px;
	margin : 0px 0px;
}

#mode,
#privacy,
#tray {
	border-radius: 2px;
	margin: 0px 0px 0px 6px;
}

#privacy {
	color: @peach;
}

/* player */

#mpris {
	border-radius: 2px;
}

/* center  */

#clock {
	border-radius: 2px;
}
#network {
	border-radius: 2px 0px 0px 2px;
}
#battery {
	border-radius: 0px 2px 2px 0px;
}


/* network config */

#network.disabled,
#network.disconnected {
	color: @blue
}

#network {
	color: @red
}

/* bluetooth config */

#bluetooth.connected {
	color: @red
}

#bluetooth.disabled,
#bluetooth.off,
#bluetooth.on {
	color: @blue
}


/* battery  */

#battery.critical:not(.charging) {
	color: @red
}

#battery.charging, #battery.plugged {
	color: @teal
}

#battery.full {
	color: @peach
}

/* temperature */

#temperature.critical {
}


/* tooltip */

tooltip {
	background-color: @crust;
	font-size : 12px;
	font-weight: 600;
	border-radius: 2px;
	padding: 0px;
	margin : 0px;
}

/* custom */

#custom-sep {
	background-color: @crust;
	font-family: JetBrains Mono, sans-serif;
	font-size: 14.5px;
	font-weight: 600;
	padding: 0px 0px;
	margin: 0px;
}
	'';
}
