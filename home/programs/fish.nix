{ config , lib , pkgs , ... } :{
  programs.fish = {
    enable = true;
    shellAliases = {
      lo = "command ls --color -lah";
      ls = lib.mkForce "${pkgs.lsd}/bin/lsd --group-directories-first";
      la = lib.mkForce "${pkgs.lsd}/bin/lsd -la --group-directories-first";
      ll = lib.mkForce "${pkgs.lsd}/bin/lsd -l --group-directories-first";

      ip = "${pkgs.iproute2}/bin/ip -c";
      less = "${pkgs.less}/bin/less -Q --use-color";
      man = "${pkgs.less}/bin/man -P 'less -Q'";
      bat = "bat -pn";
    };

    shellInit = ''
if status is-interactive
    # Commands to run in interactive sessions can go here
end


function fish_greeting
    # greet
end

set -xU MANPAGER 'less -R --use-color -Dd+r -Du+b'
set -xU MANROFFOPT '-P -c'
    '';

    functions = {
      private_mode = ''
function private_mode
  if test "$fish_private_mode"
    set -e fish_private_mode
  else
    echo "Incognito"
    set --universal fish_private_mode 1
  end
end
      '';

      into = ''
function into
  mkdir -p $argv
  cd $argv
end
      '';

      asus_fan = ''
function asus_fan
  if ! test $argv[1]
    return 1
  end

  for i in (ls "/sys/devices/platform/asus-nb-wmi/hwmon")
    set i "/sys/devices/platform/asus-nb-wmi/hwmon/"$i
    if test -e $i"/pwm1_auto_point1_temp"
      break
    end
  end

  set fan $argv[1]
  set point $argv[2]

  if test $argv[3]
    set speed $argv[3]
    set temp $(cat "$i/pwm$fan""_auto_point$point""_temp")
    set p_speed $(cat "$i/pwm$fan""_auto_point$point""_pwm")
    printf "point $point => temperature: $temp speed: $p_speed >> $speed\n"
    sudo bash -c "echo $speed > $i/pwm$fan""_auto_point$point""_pwm"
  else
    set temp $(cat "$i/pwm$fan""_auto_point$point""_temp")
    set p_speed $(cat "$i/pwm$fan""_auto_point$point""_pwm")
    printf "point $point => temperature: $temp C speed: $p_speed\n"
  end
end
      '';

    };

  };
}
