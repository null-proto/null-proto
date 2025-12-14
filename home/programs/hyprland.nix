{ config , pkgs, ...}:
let
  grim = "${pkgs.grim}/bin/grim";
  slurp = "${pkgs.slurp}/bin/slurp";
  firefox = "${pkgs.firefox}/bin/firefox";
  cliphist="${pkgs.cliphist}/bin/cliphist";
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
  swaylock = "${pkgs.swaylock-effects}/bin/swaylock";
  terminal = "${pkgs.kitty}/bin/kitty";
  wpctl = "${pkgs.wireplumber}/bin/wpctl";
  playerctl = "${pkgs.playerctl}/bin/playerctl";
  fileManager = "${pkgs.nautilus}/bin/nautilus -w";
  rofiShow = "rofi -show";
  rofiDmenu = "rofi -dmenu";

  notify = "${pkgs.dunst}/bin/dunstify";
  hyprctl = "${pkgs.hyprland}/bin/hyprctl";

  mod = "SUPER";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      monitor = [
        "eDP-1,1980x1080@144, auto ,1"
      ];

      "exec-once" = [
        "${pkgs.waybar}/bin/waybar"
        "${pkgs.hyprpaper}/bin/hyprpaper"
        "sleep 1 && ${hyprctl} keyword animations:enabled true"
      ];

      general = {
        gaps_in = 10;
        gaps_out = 40;
        border_size = 3;
        "col.active_border" = "rgb(313244)";
        "col.inactive_border" = "rgb(313244)";
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
        animation = [
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
        # "bordercolor rgba(44324480),xwayland:1"
        # "bordercolor rgba(ffffff00),title:Picture-in-Picture"
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
        "${mod}, RETURN, exec, ${terminal}"
        "${mod}, TAB, exec, ${terminal}"
        "${mod}, F, fullscreen,"
        "${mod}, E, exec, ${fileManager}"
        "${mod}, P, pseudo,"
        "${mod}, J, togglesplit,"
        "${mod}, W, exec, ${rofiShow} calc"
        "${mod}, D, exec, ${rofiShow} run"
        "${mod}, Q, exec, ${rofiShow} window"

        "${mod} SHIFT, SPACE,togglefloating,"
        "${mod} SHIFT, P,pin,"

        "${mod} SHIFT, W,exec, ${rofiShow} emoji"
        "${mod} SHIFT, D,exec, ${rofiShow} drun"
        "${mod} SHIFT, E,exec, ${firefox}"
        "${mod} SHIFT, Y,exec, ${cliphist} list | ${rofiDmenu}  | ${cliphist} decode | wl-copy"

        "${mod} SHIFT, Q, killactive,"
        "${mod} SHIFT, M, exit,"
        "${mod}, Z, exec, ${swaylock} --indicator-idle-visible -t --indicator-radius 200 --indicator-thickness 20 --ring-color 181825 --ring-clear-color 0070ff --separator-color 45475a --key-hl-color cdd6f4 --inside-color 11111b --inside-clear-color 94e2d5 --inside-caps-lock-color 45475a --inside-ver-color fab387 --inside-wrong-color f38ba8 -r --line-color 1e1e2e --line-clear-color 89dceb --line-caps-lock-color 313244 --line-ver-color f9e2af --line-wrong-color eba0ac --ring-color 181825 --ring-clear-color 89dceb --ring-caps-lock-color 313244 --ring-ver-color f9e2af --ring-wrong-color eba0ac --text-color 6c7086 --text-clear-color 313244 --text-caps-lock-color 181825 --text-ver-color f9e2af --text-wrong-color eba0ac --screenshot --effect-blur 7x9 --effect-vignette 0.5:0.4 --effect-pixelate 30 --clock --fade-in 0.1"
        "${mod}, left , movefocus, l"
        "${mod}, right, movefocus, r"
        "${mod}, up, movefocus, u"
        "${mod}, down, movefocus, d"

        "${mod}, 1, workspace, 1"
        "${mod}, 2, workspace, 2"
        "${mod}, 3, workspace, 3"
        "${mod}, 4, workspace, 4"
        "${mod}, 5, workspace, 5"
        "${mod}, 6, workspace, 6"
        "${mod}, 7, workspace, 7"
        "${mod}, 8, workspace, 8"
        "${mod}, 9, workspace, 9"
        "${mod}, 0, workspace, 10"

        "${mod} SHIFT, 1, movetoworkspace, 1"
        "${mod} SHIFT, 2, movetoworkspace, 2"
        "${mod} SHIFT, 3, movetoworkspace, 3"
        "${mod} SHIFT, 4, movetoworkspace, 4"
        "${mod} SHIFT, 5, movetoworkspace, 5"
        "${mod} SHIFT, 6, movetoworkspace, 6"
        "${mod} SHIFT, 7, movetoworkspace, 7"
        "${mod} SHIFT, 8, movetoworkspace, 8"
        "${mod} SHIFT, 9, movetoworkspace, 9"
        "${mod} SHIFT, 0, movetoworkspace, 10"

        "${mod}, S, togglespecialworkspace, magic"
        "${mod} SHIFT, S, movetoworkspace, special:magic"

        "${mod}, mouse_down, workspace, e+1"
        "${mod}, mouse_up, workspace, e-1"


        #", Print, exec, grim && notify-send -u low system 'Copying visual' --icon image"
        #"SHIFT , Print, exec, grim -g "$(slurp -d)" && notify-send -u low system 'Copying peremeter' --icon image"

        ",Print, exec, GRIM_DEFAULT_DIR=~/Pictures/Screenshots/ ${grim} && ${notify} -u low 'Copying visual' 'screenshot' --icon display"
        "SHIFT , Print, exec,GRIM_DEFAULT_DIR=~/Pictures/Screenshots/ ${grim} -g \"\$(${slurp} -d)\" && ${notify} -u low 'Copying peremeter' 'screensot' --icon display"
      ];

      bindl = [
        ", XF86Launch3 , exec , ${rofiShow} drun"
        ", sleep-button , exec , ${rofiShow} drun"
        ", XF86AudioHome, exec, ${firefox}"
        ", XF86AudioPlay, exec, ${playerctl} play-pause"
        ", XF86AudioPrev, exec, ${playerctl} previous"
        ", XF86AudioNext, exec, ${playerctl} next"
        ", XF86AudioMute, exec, ${wpctl} set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      binde = [
        ", XF86MonBrightnessUp , exec , ${brightnessctl} set 1+"
        ", XF86MonBrightnessDown , exec , ${brightnessctl} set 1-"
        ", XF86AudioLowerVolume, exec, ${wpctl} set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioRaiseVolume, exec, ${wpctl} set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ];

      bindm = [
        "${mod}, mouse:272, movewindow"
        "${mod}, mouse:273, resizewindow"
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
