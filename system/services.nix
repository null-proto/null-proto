{ pkgs, ... }: {

  services = {
    speechd.enable = false;
    orca.enable = false;
    ntp.enable = false;
    timesyncd.enable = true;
    # nscd.package = pkgs.glibc;
    
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;

    greetd = {
      enable = true;
      settings = {
        default_session = let tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet"; in {
          command = "${tuigreet} --time --remember --remember-session --sessions ${pkgs.hyprland}/share/wayland-session";
          session = "${pkgs.hyprland}/share/wayland-session";
          user = "greeter";
        };
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      extraConfig.pipewire = {};
    };

    # blueman = { enable = true; };

    xserver = { videoDrivers = [ "nvidia" ]; };

    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = [ "*" ];
          settings = {
            main = {
              capslock = "overload(control,esc)";
              esc = "capslock";
            };
          otherlayer = {};
          }; # extraConfig = '''';
        };
      };
    };

    # polkit.extraConfig = ''
    #   /* Allow local users to mount system disks */
    #   polkit.addRule(function(action, subject) {
    #     if ( subject.local && action.id == "org.freedesktop.udisks2.filesystem-mount-system") {
    #       return polkit.Result.YES;
    #     }
    # });
    # '';
  };
}
