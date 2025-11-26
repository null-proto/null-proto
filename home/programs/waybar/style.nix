{
  waybarStyle = ''
@define-color base			#303446;
@define-color mantle		#292c3c;
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

@define-color text      #cdd6f4;


@define-color bg     @crust;
@define-color fg     @surface1;

@define-color fg_active     @text;

@define-color border     @base;
@define-color accent     @base;
@define-color secondary     @base;
@define-color alert     @red;


* {
	font-family: JetBrainsMono Nerd Font, sans-serif;
	font-size: 14.5px;
	font-weight: 600;
	margin: 0px 0px 0px 0px;
 	padding : 0px 0px;
}


window#waybar {
	background-color: rgba(0,0,0,0);
	margin : 0px 0px 0px 0px;
}


/* workspaces */

#workspaces {
	background-color: @bg;
	border-radius: 6px;
	border: 2px;
	border-right: 12px;


	border-color: @border;
	border-style: solid;
	border-width: 3px;

}

#workspaces button {
	color: @fg;
	padding: 0px 4px 0px 4px;
	background-color: @bg;
	border-color: @border;
	border-radius: 6px;
}

#workspaces button.visible {
	color : @fg_active;
}

#workspaces button.focused {
	color : @fg_active;
}

#workspaces button.urgent {
	color : @alert;
}

#workspaces button.persistent {
}

#workspaces button.empty {
	background-color: @crust;
	border-color: @crust;
}

#workspaces button.current_output {
	background-color: @crust;
	border-color: @crust;
}

#workspaces button:first-child {
	background-color: @crust;
}

#workspaces button:last-child {
	background-color: @crust;
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

#mpris {
	border-color: @border;
	border-style: solid;
	border-width: 3px;
}

/* center  */

#clock {
	padding: 0px 8px;
	border-radius: 6px;
	border-color: @border;
	border-style: solid;
	border-width: 3px;
}

#network {
	border-radius: 6px 0px 0px 6px;
	border-top: 3px;
	border-bottom: 3px;
	border-left: 3px;
	border-style: solid;
	border-color: @border;
}

#temperature,
#backlight,
#wireplumber,
#bluetooth {
	border-radius: 0px;
	border-top: 3px;
	border-bottom: 3px;
	border-style: solid;
	border-color: @border;
}

#battery {
	border-radius: 0px 6px 6px 0px;
	border-top: 3px;
	border-bottom: 3px;
	border-right: 3px;
	border-style: solid;
	border-color: @border;
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

#bluetooth.connected {
	color: @fg_active;
}

#bluetooth.disabled,
#bluetooth.off,
#bluetooth.on {
	color: @blue
}


/* battery  */

#battery.critical:not(.charging) {
	color: @alert
}


#battery.plugged {
	color: @fg
}

#battery.charging {
	color: @accent
}

#battery.full {
	color: @fg
}

/* temperature */

#temperature {
	color: @fg;
}

#temperature.critical {
	color: @alert;
}



#backlight {
	color: @fg;
}

#backlight :hover{
	color: @fg_active;
}

#wireplumber {
	color: @fg;
}

#wireplumber :hover{
	color: @fg_active;
}


/* tooltip */

tooltip {
	padding: 4px;
	background-color: @crust;
	border-radius: 2px;
	border-color: @border;
	border-style: solid;
	border-width: 3px;
}

/* custom */

#custom-sep {
	background-color: @crust;
	font-family: JetBrains Mono, sans-serif;
}
  '';
}
