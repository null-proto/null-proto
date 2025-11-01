{ lib ,pkgs , ... }:{

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

    activation.afterSwitch = lib.mkAfter '' '';
  };
}
