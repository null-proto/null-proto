{ pkgs , inputs , ... }: {

  xdg = {

		autostart = {
			enable = false;
			entries = [];
			readOnly = true;
		};

		mimeApps = {
			enable = true;

			defaultApplications = {
				"application/pdf" = [ "org.gnome.Papers.desktop" ];
				"application/vnd.openxmlformats-officedocument.presentationml.presentation" = [ "org.gnome.Papers.desktop" ];
				"application/vnd.powdertoy.save" = [ "powdertoy-uk.co.powdertoy.tpt.desktop" ];
				"audio/mp4" = [ "mpv.desktop" ];
				"image/gif" = [ "imv.desktop" ];
				"image/jpeg" = [ "imv-dir.desktop" ];
				"image/png" = [ "imv-dir.desktop" ];
				"inode/directory" = [ "org.gnome.Nautilus.desktop" ];
				"video/mp4" = [ "mpv.desktop" ];
				"video/quicktime" = [ "mpv.desktop" ];
				"x-scheme-handler/ptsave" = [ "powdertoy-uk.co.powdertoy.tpt.desktop" ];
			};

			associations.added = {
				"application/pdf" = [ "org.gnome.Papers.desktop" ];
				"application/vnd.openxmlformats-officedocument.presentationml.presentation" = [ "org.gnome.Papers.desktop" ];
				"audio/mp4" = [ "audacious.desktop" "mpv.desktop" ];
				"image/gif" = [ "imv.desktop" ];
				"image/jpeg" = [ "imv.desktop" "imv-dir.desktop" ];
				"image/png" = [ "imv.desktop" "imv-dir.desktop" ];
				"inode/directory" = [ "org.gnome.Nautilus.desktop" ];
				"video/mp4" = [ "mpv.desktop" ];
				"video/quicktime" = [ "mpv.desktop" ];
			};
		};

    portal.enable = true;
    portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];

    # configFile."rofi/themes/blackglass.rasi".source = (import ./rofi/blackglass.nix).config ;
    configFile."rofi/themes/fsf.rasi".text = (import ./rofi/fsf.nix).fsf;

    configFile.nvim = {
      source = inputs.nvim-config;
      recursive = true;
    };
  };
}
