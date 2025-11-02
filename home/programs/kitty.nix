{ config , pkgs , ...}: {
  programs.kitty = {
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

      window_padding_width = 8;
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
}
