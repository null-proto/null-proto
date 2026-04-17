{ pkgs , ... }: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi.override { plugins= [ pkgs.rofi-emoji pkgs.rofi-calc ];};
    theme = "fsf,fsf-noicon";

    extraConfig = {
      modi = "drun,run,window,calc,emoji,combi";
      show-icons = true;
      terminal = "kitty";
      # drun-display-format = "{name}";
    };
  };
}
