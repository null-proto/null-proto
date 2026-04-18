{ ... }:{
  # programs.swaylock = {
  #   enable = true;
  #   package = pkgs.swaylock-effects;
  # };

	programs.hyprlock = {
		enable = true;

		settings = {

			"$font" = "VictorMono Nerd Font Bold";

			general = {
				hide_cursor = false;
			};

			animations = {
				enabled = true;
				bezier = [ "linear, 1, 1, 0, 0" ];
				animation = [ "fadeIn, 0, 0, linear" "fadeOut, 1, 5, linear" "inputFieldDots, 1, 2, linear" ];
			};

			background = {
				monitor = "";
				path = "screenshot";
				blur_passes = 3;
				brightness = 0.4;
			};

			input-field = {
				monitor = "";
				size = "20%, 50% , 20% , 5% , 20% , 5%";
				outline_thickness = 5;
				rounding = 0;

				inner_color = "rgba(0, 0, 0, 0.4)"; # no fill

				outer_color = "rgb(205, 214, 244) rgb(245, 224, 220) 45deg";
				check_color = "rgb(116, 199, 236) rgb(180, 190, 254)  rgb(249, 226, 175) 120deg";
				fail_color =  "rgb(250, 179, 135) rgb(235, 160, 172) 40deg";
				capslock_color = "rgb(148, 226, 213) rgb(203, 166, 247) 45deg";

				font_color = "rgb(205, 214, 244)";
				fade_on_empty = false;

				font_family = "$font";
				placeholder_text = "LOCKED";
				fail_text = "FAILED";

				# uncomment if you wish to display a message during authentication
				check_text = "AUTH";

				# uncomment to use a letter instead of a dot to indicate the typed password
				# dots_text_format = 󰝤
				# dots_size = 0.2
				# dots_spacing = 1

				# uncomment to use an input indicator that does not show the password length (similar to swaylock's input indicator)
				hide_input = true;

				position = "0, -20";
				halign = "center";
				valign = "center";

				shadow_passes = 0;
				shadow_size = 0;
			};

			label  = [ {
				monitor = "";
				text = ''cmd[update:1000] date "+%Y-%m-%d %H:%m.%S"'';
				color ="rgba(205, 214, 244, 0.7)";
				font_size = 12;
				font_family = "$font";

				position = "0, 0";
				halign = "right";
				valign = "bottom";
				shadow_passes = 0;
				shadow_size = 0;
			}

			{
				monitor = "";
				text =''cmd[] if [ -n "$FAIL" ]; then printf "login attempt: [$ATTEMPTS]\nLogin: $FAIL\nlibPAM failed: $PAMFAIL\n" >> ~/.cache/authlog; fi; while IFS= read -r line; do if [ -n "$line" ]; then echo "$line"; fi; done < ~/.cache/authlog'';
				color ="rgba(205, 214, 244, 0.7)";
				font_size = 12;
				font_family ="$font";
				halign ="left";
				valign ="bottom";
				shadow_passes = 0;
				shadow_size = 0;
			}
		];
		};
	};
}
