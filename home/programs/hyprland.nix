{ config , pkgs, ...}:{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      monitor = [
        "eDP-1,1980x1080@144, auto ,1"
      ];

      "$mainMod" = "SUPER";
      "$terminal" = "${pkgs.kitty}/bin/kitty";
      "$fileManager" = "${pkgs.nautilus}/bin/nautilus -w";
      "$menu" = "rofi -show";
      "$menu_raw" = "rofi -dmenu";
      "$cliphist"="${pkgs.cliphist}/bin/cliphist";
      "$ff" = "${pkgs.firefox}/bin/firefox";
      "$swaylock" = "${pkgs.swaylock}/bin/swaylock";
      "$girm" = "${pkgs.grim}/bin/grim";
      "$slurp" = "${pkgs.slurp}/bin/slurp";
      "$brightnessctl" = "${pkgs.brightnessctl}/bin/brightnessctl";
      "$playerctl" = "${pkgs.playerctl}/bin/playerctl";
      "$wpctl" = "${pkgs.wireplumber}/bin/wpctl";

      "exec-once" = [
        "${pkgs.waybar}/bin/waybar"
        "${pkgs.hyprpaper}/bin/hyprpaper"
        "sleep 1 && hyprctl keyword animations:enabled true"
      ];

      general = {
        gaps_in = 10;
        gaps_out = 40;
        border_size = 2;
        "col.active_border" = "rgb(313244)";
        "col.inactive_border" = "rgba(31324433)";
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 3;
        rounding_power = 3;
          active_opacity = "1.0";
          blur = {
            enabled = true;
            size = 0;
            passes = 6;
            new_optimizations = true;
            vibrancy = "0.1696";
          };
        shadow = {
          enabled = false;
        };
      };

      animations = {
        enabled = false;
        # first_launch_animation = false;
        bezier = [ "myBezier, 0.05, 0.5, 0.9, 1" ];
        # animation = [ "windows, 1, 4, default , popin 80% , fade 20%" "workspaces, 1, 2, default" ];
        "animation" = [
          "windows, 1, 4, default , slide bottom"
          "workspaces, 1, 2, default"
        ];
      };

      "dwindle" = {
        "pseudotile" = true;
        "preserve_split" = true;
      };

      "master" = { "new_status" = "master"; };

      "group:groupbar" = { "enabled" = false; };

      misc = {
        enable_anr_dialog = false;
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        vrr = 0;
        enable_swallow = false;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
      };

      ecosystem = {
        no_update_news = true;
      };

      input = {
          kb_layout = "us";
          follow_mouse = 1;
          sensitivity = "0.7";
          repeat_delay = 300;
          repeat_rate = 30;

          touchpad = {
            disable_while_typing = true;
            tap-to-click = true;
            tap-and-drag = true;
            tap_button_map = "lrm";
            natural_scroll = false;
            scroll_factor = "1.0";
            middle_button_emulation = false;
          };
      };

      gestures = [ ];

      device = {
          name = "epic-mouse-v1";
          sensitivity = "0.5";
      };

      layerrule = [
        "blur,rofi"
        "ignorealpha,rofi"
      ];

      windowrulev2 = [
        "noblur, title:^(.*)"
        "rounding 0,class:^(.*\.exe)"
        "pin,title:Picture-in-Picture"
        "float,title:Picture-in-Picture"
        "move 100%-w-10 5%,title:Picture-in-Picture"
        "bordercolor rgba(44324480),xwayland:1"
        "bordercolor rgba(ffffff00),title:Picture-in-Picture"
      ];

      workspace = [
        # "special:scratchpad, on-created-empty:kitty"
      ];

      env = [
        "QT_QPA_PLATFORM,wayland-egl"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "CLUTTER_BACKEND,wayland"
        "SDL_VIDEODRIVER,wayland"
        "EGL_PLATFORM,wayland"
        "GDK_BACKEND,wayland"
      ];

      bind = [
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, TAB, exec, $terminal"
        "$mainMod, F, fullscreen,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, W, exec, $menu calc"
        "$mainMod, D, exec, $menu run"
        "$mainMod, Q, exec, $menu window"

        "$mainMod SHIFT, SPACE,togglefloating,"
        "$mainMod SHIFT, P,pin,"

        "$mainMod SHIFT, W,exec, $menu emoji"
        "$mainMod SHIFT, D,exec, $menu drun"
        "$mainMod SHIFT, E,exec, $ff"
        "$mainMod SHIFT, Y,exec, \"$cliphist list | $menu_raw  | $cliphist decode | wl-copy\""

        "$mainMod SHIFT, Q, killactive,"
        "$mainMod SHIFT, M, exit,"
        "$mainMod, Z, exec, $swaylock -c 1e1e2e --indicator-idle-visible -t --indicator-radius 200 --indicator-thickness 20 --ring-color 181825 --ring-clear-color 0070ff --separator-color 45475a --key-hl-color cdd6f4 --inside-color 11111b --inside-clear-color 94e2d5 --inside-caps-lock-color 45475a --inside-ver-color fab387 --inside-wrong-color f38ba8 -r --line-color 1e1e2e --line-clear-color 89dceb --line-caps-lock-color 313244 --line-ver-color f9e2af --line-wrong-color eba0ac --ring-color 181825 --ring-clear-color 89dceb --ring-caps-lock-color 313244 --ring-ver-color f9e2af --ring-wrong-color eba0ac --text-color 6c7086 --text-clear-color 313244 --text-caps-lock-color 181825 --text-ver-color f9e2af --text-wrong-color eba0ac"
        "$mainMod, left , movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"


        #", Print, exec, grim && notify-send -u low system 'Copying visual' --icon image"
        #"SHIFT , Print, exec, grim -g "$(slurp -d)" && notify-send -u low system 'Copying peremeter' --icon image"

        ",Print, exec, GRIM_DEFAULT_DIR=~/Pictures/Screenshots/ $grim && dunstify -u low 'Copying visual' 'screenshot' --icon display"
        "SHIFT , Print, exec,GRIM_DEFAULT_DIR=~/Pictures/Screenshots/ $grim -g '$($slurp -d)' && dunstify -u low 'Copying peremeter' 'screensot' --icon display"
      ];

      bindl = [
        ", XF86Launch3 , exec , $menu drun"
        ", sleep-button , exec , $menu drun"
        ", XF86AudioHome, exec, $ff"
        ", XF86AudioPlay, exec, $playerctl play-pause"
        ", XF86AudioPrev, exec, $playerctl previous"
        ", XF86AudioNext, exec, $playerctl next"
        ", XF86AudioMute, exec, $wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      binde = [
        ", XF86MonBrightnessUp , exec , $brightnessctl set 1+"
        ", XF86MonBrightnessDown , exec , $brightnessctl set 1-"
        ", XF86AudioLowerVolume, exec, $wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioRaiseVolume, exec, $wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
        "ALT, mouse:272, movewindow"
      ];
    };


    extraConfig = ''
env = EDITOR,nvim
env = VISUAL,nvim
    '';
    plugins = [];
    # settings = {};

  };
}
