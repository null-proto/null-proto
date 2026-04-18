{ pkgs ,... } :let 
inherit (import ../secrets.nix) profile;
in {

  # systemd.services.greetd.serviceConfig = {
  #   Type = "idle";
  #   StandardInput = "tty";
  #   StandardOutput = "tty";
  #   StandardError = "journal";
  #   TTYReset = true;
  #   TTYVHangup = true;
  #   TTYVTDisallocate = true;
  # };

	systemd.services."getty@tty1" = {
    overrideStrategy = "asDropin";
    serviceConfig.ExecStart = [
      "" # An empty string clears the original ExecStart inherited from the template
      "@${pkgs.util-linux}/sbin/agetty agetty --login-program ${pkgs.shadow}/bin/login --autologin ${profile.username} --noclear %I $TERM"
    ];
  };

  systemd.tmpfiles.rules = [ "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware" ];


  # systemd.user.services.hyprland = {
  #   description = "Hyprland Wayland session";
  #   after = [ "graphical.target" ];
  #   serviceConfig.ExecStart = "${pkgs.hyprland}/bin/Hyprland";
  #   wantedBy = [ "default.target" ];
  #   enable = true;
  # };
}
