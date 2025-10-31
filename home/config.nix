{ pkgs, ... }: let
  inherit (import ./programs/hyprland.nix) hyprConfig;
  inherit (import ./programs/dunst.nix) dunstConfig;
in {
  home.packages = with pkgs; [
    alacritty
    alacritty-theme

    playerctl
    papers
    audacious

    jmtpfs
    lf
    gdb
    gef
    ffmpeg

    hyprpaper
    hyprpicker

    neofetch
    fastfetch
    zoxide
    lsd
    cyme
    typos-lsp
    nautilus
    waybar
    slurp
    grim
    qemu
    gh
    nwg-look
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    wl-clipboard
    cliphist

    yaml-language-server
    vscode-langservers-extracted
    lua-language-server
    fish-lsp
    bash-language-server
    tailwindcss-language-server

    android-studio
  ];



  # services.ssh-agent.enable = true;

  # programs.ssh.startAgent = true;

  programs = {
    firefox = {
      enable = true;
      package =  pkgs.firefox;
    };



    rofi = {
      enable = true;
      package = pkgs.rofi-wayland.override { plugins= [ pkgs.rofi-emoji pkgs.rofi-calc ];};
    };


    bat = {
      enable = true;
      # themes = {
      #   catppuccin-mocha = {
      #     src = catppuccin-bat;
      #     file = "extra/Catppuccin%20Mocha.tmTheme";
      #    };
      # };
      #
      # config = {
      #  theme = "catppuccin-mocha";
      # };
    };

    fzf.enable = true;
    btop.enable = true;
    ripgrep.enable = true;
    lsd.enable = true;

    imv.enable = true;
    mpv.enable = true;

    direnv = {
      enable = true;
      enableBashIntegration = false;
      enableFishIntegration = true;
    };

    swaylock.enable = true;
  };
  
  services = {
    dunst = {
      package = pkgs.dunst;
      enable = true;
      settings = dunstConfig;
    };
  };

  home = {
		pointerCursor = {
			enable = true;
			package = pkgs.bibata-cursors;
			name = "Bibata-Modern-Ice";
			size = 24;
			gtk.enable = true;
			hyprcursor.enable = true;
		};

		preferXdgDirectories = true;

		sessionVariables = { # not work if not using PAM -> systemd --user
			EDITOR="nvim";
			VISUAL="nvim";
			GRIM_DEFAULT_DIR="~/Pictures/Screenshots/";
			GTK_THEME_VARIANT="dark";
			XCURSOR_THEME="Bibata-Modern-Ice";
			XCURSOR_SIZE=24;
		};

		shell = {
			enableFishIntegration = true;
			enableBashIntegration = true;
		};
	};

  gtk = {
    enable = true;

      #   cursorTheme = {
      #     # package = pkgs.breeze-hacked-cursor-theme;
      # name = "ArcMidnight-cursors";
      # size = 24;
      #   };


    font = {
      package = pkgs.nerd-fonts.comic-shanns-mono;
      name = "ComicShannsMono Nerd Font";
      size = 12;
    };

    iconTheme = {
      # package = pkgs.vimix-icon-theme;
      name  ="Colloid-Dark";
    };

    theme = {
      # package = pkgs.colloid-gtk-theme;
      name = "Colloid-Dark";
    };
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
    };
  };



  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "25.05";
}
