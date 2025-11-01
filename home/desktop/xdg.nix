{ pkgs , ... }: {

  xdg = {
    portal.enable = true;
    portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  };

  xdg.configFile."rofi/themes/blackglass.rasi".source = ./rofi/blackglass.rasi;
}
