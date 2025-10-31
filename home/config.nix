{ pkgs, ... }: let
  inherit (import ./programs/hyprland.nix) hyprConfig;
  inherit (import ./programs/tmux.nix) tmuxConfig;
  inherit (import ./programs/dunst.nix) dunstConfig;
  inherit (import ./programs/waybar/config.nix) waybarConfig;
  inherit (import ./programs/waybar/style.nix) waybarStyle;
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

    kitty = {
      enable = true;

      font = {
        size = 10;
        name = "JetBrainsMono Nerd Font";
      };

      settings = {
        bold_font = "family='JetBrainsMono Nerd Font bold'";
        italic_font = "family='maple mono nf'";
        italic_bold_font = "family='maple mono nf'";
        modify_font = "cell_height 0.7px underline_position 4 underline_thickness 150%";

        window_padding_width = 2;
        background_blur = 1;
        underline_hyperlinks = "hover";
        detect_urls = "yes";

        cursor_beam_thickness = "1.5";
        cursor_underline_thickness = "2.0";
        cursor_blink_interval = -1;
        cursor_stop_blinking_after = 15;

        undercurl_style = "thick-sparse";

        # url_color = "#0087bd";
        url_style = "dashed"; # curly

        enable_audio_bell = "no";

        cursor_trail = 1;
        cursor_trail_decay = "0.1 0.5";
      };

      keybindings = {
        "ctrl+shift+c" =  "copy_to_clipboard";
        "ctrl+shift+v" = "paste_from_clipboard";
      };
    };

    rofi = {
      enable = true;
      package = pkgs.rofi-wayland.override { plugins= [ pkgs.rofi-emoji pkgs.rofi-calc ];};
    };

		waybar = {
			enable = true;

			settings = {
				mainBar = waybarConfig;
			};

			style = waybarStyle;
		};

    tmux = {
      enable = true;
      extraConfig = tmuxConfig;
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

    starship.enable = true;
    swaylock.enable = true;
  };
  
  services = {
    dunst = {
      package = pkgs.dunst;
      enable = true;
      settings = dunstConfig;
    };
  };

  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
    gtk.enable = true;
    hyprcursor.enable = true;
  };

  home.file.".config/nixpkgs/config.nix".text = ''
{
allowUnfree = true;
}
  '';


  home.preferXdgDirectories = true;

  home.sessionVariables = { # not work if not using PAM -> systemd --user
    EDITOR="nvim";
    VISUAL="nvim";
    GRIM_DEFAULT_DIR="~/Pictures/Screenshots/";
    GTK_THEME_VARIANT="dark";
    XCURSOR_THEME="Bibata-Modern-Ice";
    XCURSOR_SIZE=24;
  };

  home.shell = {
    enableFishIntegration = true;
    enableBashIntegration = true;
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


  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;

    settings = hyprConfig;

    extraConfig = ''
env = EDITOR,nvim
env = VISUAL,nvim
    '';
    plugins = [];
    # settings = {};
  };

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "25.05";
}
