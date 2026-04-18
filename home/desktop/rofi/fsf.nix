{
	fsf = ''
configuration{
  modi: "calc,emoji,drun,run,combi,window,ssh,filebrowser";
  show-icons: false;
  terminal: "kitty";
  drun-display-format: "{name}";
  location: 1;
  disable-history: false;
  hide-scrollbar: true;

  display-drun: " DRun ";
  display-run: " Run ";

  display-window: " Window ";
  display-combi: " Combi ";


  display-filebrowser: " Fs ";
  display-ssh: " SSH ";

	display-calc: " Calculator ";
	display-emoji: " Emoji ";
  sidebar-mode: false;
}

* {
	base	 : #303446;
	mantle : #292c3c;
	crust  : #131624;

	text   : #cdd6f4;
	text-muted   : #cdd6f4;

	border : #363a4f;

	surface0 : #363a4f;
	surface1 : #494d64;

	red   : #f77274;
	teal  : #71d8ce;
	cyan  : #99d1db;
	peach : #ff9f46;

	mauve     : #c6a0f6;
	rosewater : #f4dbd6;
	lavender  : #b7bdf8;
	sapphire  : #7dc4e4;
	blue      : #6abdf4;
	maroon    : #fe89a0;
	pink      : #f5bde6;
	sky       : #91d7e3;
	yellow    : #fef40f;
	olive     : #eee47f;


  width: 100%;
  font: "VictorMono Nerd Font Bold 10.6";
}


element-text, element-icon , mode-switcher {
  background-color: inherit;
  text-color:       inherit;
}

window {
  height: 386px;
	width: 100%;
  border: 0px;
	padding: 0px;
	border-radius: 0px;
  border-color: @border;
  background-color: @crust;
	separator-style: none;
}

mainbox {
  background-color: @crust;
	color : @text;
	margin: 0px;
}

inputbar {
	margin: 0px;
  children: [ prompt,entry];
  border-radius: 0px;
  padding: 4px;
}

textbox-prompt-colon {
  expand: false;
  str: ":";
}

prompt, entry {
  padding-right: 4px;
  text-color: @text;
}

prompt {
  padding: 4px;
  background-color: @base;
}

entry {
	padding: 4px 4px 4px 8px;
  background-color: @mantle;
}

case-indicator {
	background-color:               @red;
	text-color:                     @text;
	spacing:                        0;
}


listview {
	border: 0px;
	border-color: transparent;
  margin: 0px 4px;
  columns: 5;
  lines: 8;
	background-color: transparent;
}

element {
  padding: 6px;
	margin : 0px;
	border-radius: 0px;
  background-color: @base;
  text-color: @text;
	icon-spacing: 0px;
	border: 0px;
	spacing: 0px;

}

element-icon {
	display: none;
}

selected.normal {
  size: 8px;
	padding: 4px;
	border-radius: 0px;
	background-color: @base;
}

element-text {
  background-color: transparent;
  text-color:       @text;
	padding: 0px;
}

element normal.normal{
	background-color: transparent;
}

element normal.urgent{
	background-color: transparent;
}

element normal.active{
	background-color: transparent;
}

element alternate.normal {
	background-color: transparent;
}

element alternate.urgent {
	background-color: transparent;
}

element alternate.active {
	background-color: transparent;
}

element selected.normal {
	background-color: @base;
	padding: 4px;
}

element selected.urgent {
	background-color: @base;
	padding: 4px;
}

element selected.active {
	background-color: @base;
	padding: 4px;
}


mode-switcher {
  spacing: 0;
}

button {
	padding: 0px;
	background-color: transparent;
	text-color: @text;
	vertical-align: 0.5; 
	horizontal-align: 50%;
}

button selected {
  background-color: @base;
  text-color: @text;
}

message {
	background-color: transparent;
	margin: 0px;
	padding: 0px;
	border-radius: 0px;
}

textbox {
	padding: 4px;
	margin: 0px;
	text-color: @text;
	background-color: transparent;
	border: 0px;
	spacing: 0px;
}


scrollbar {
	color : @red;
	background-color: transparent;
	handle-color: @base;
	handle-width: 2px;
  width:        0px ;
  border:       0;
  padding:      0;
	margin : 0px 0px 0px 0px;
}
	'';
}
