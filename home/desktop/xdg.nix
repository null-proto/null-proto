{ pkgs , inputs , ... }: {

  xdg = {
    portal.enable = true;
    portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];

    # configFile."rofi/themes/blackglass.rasi".source = (import ./rofi/blackglass.nix).config ;
    configFile."rofi/themes/blackglass.rasi".text = (import ./rofi/blackglass.nix).config ;

    configFile.nvim = {
      source = inputs.nvim-config;
      recursive = true;
    };
  };
}
