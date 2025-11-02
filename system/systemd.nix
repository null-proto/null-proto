{ ... } : {

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  # systemd.user.services.hyprland = {
  #   description = "Hyprland Wayland session";
  #   after = [ "graphical.target" ];
  #   serviceConfig.ExecStart = "${pkgs.hyprland}/bin/Hyprland";
  #   wantedBy = [ "default.target" ];
  #   enable = true;
  # };
}
