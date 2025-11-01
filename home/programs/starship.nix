{ config , pkgs , ...}: {

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      aws.symbol ="  ";
      buf.symbol =" ";
      c.symbol =" ";
      conda.symbol =" ";
      crystal.symbol =" ";
      dart.symbol =" ";
      directory.read_only =" 󰌾";
      docker_context.symbol =" ";
      elixir.symbol =" ";
      elm.symbol =" ";
      fennel.symbol =" ";
      fossil_branch.symbol =" ";
      git_branch.symbol =" ";
      golang.symbol =" ";
      guix_shell.symbol =" ";
      haskell.symbol =" ";
      haxe.symbol =" ";
      hg_branch.symbol =" ";
      java.symbol =" ";
      julia.symbol =" ";
      kotlin.symbol =" ";
      lua.symbol =" ";
      memory_usage.symbol ="󰍛 ";
      meson.symbol ="󰔷 ";
      nim.symbol ="󰆥 ";
      nix_shell.symbol =" ";
      nodejs.symbol =" ";
      ocaml.symbol =" ";
      package.symbol ="󰏗 ";
      perl.symbol =" ";
      php.symbol =" ";
      pijul_channel.symbol =" ";
      python.symbol =" ";
      rlang.symbol ="󰟔 ";
      ruby.symbol =" ";
      rust.symbol =" ";
      scala.symbol =" ";
      swift.symbol =" ";
      zig.symbol =" ";

      os.symbols = {
        Alpaquita = " ";
        Alpine = " ";
        Amazon = " ";
        Android = " ";
        Arch = " ";
        Artix = " ";
        CentOS = " ";
        Debian = " ";
        DragonFly = " ";
        Emscripten = " ";
        EndeavourOS = " ";
        Fedora = " ";
        FreeBSD = " ";
        Garuda = "󰛓 ";
        Gentoo = " ";
        HardenedBSD = "󰞌 ";
        Illumos = "󰈸 ";
        Linux = " ";
        Mabox = " ";
        Macos = " ";
        Manjaro = " ";
        Mariner = " ";
        MidnightBSD = " ";
        Mint = " ";
        NetBSD = " ";
        NixOS = " ";
        OpenBSD = "󰈺 ";
        openSUSE = " ";
        OracleLinux = "󰌷 ";
        Pop = " ";
        Raspbian = " ";
        Redhat = " ";
        RedHatEnterprise = " ";
        Redox = "󰀘 ";
        Solus = "󰠳 ";
        SUSE = " ";
        Ubuntu = " ";
        Unknown = " ";
        Windows = "󰍲 ";
      };

      character = {
        format = "$symbol ";
        success_symbol = "[  ](bold #2ac3de)";
        error_symbol = "[ ](bold #ff9e64)";
        vimcmd_symbol = "[NORMAL : ](bold #2ac3de)";
        vimcmd_visual_symbol = "[VISUAL : ](bold yellow)";
        vimcmd_replace_symbol = "[REPLACE : ](bold purple)";
        vimcmd_replace_one_symbol = "[RE-ONE : ](bold purple)";
        disabled = false;
      };

      # [username]
      # format = '[$user](bolt #FF7799) [on](normal #e1e1e1) '
      # show_always = true
      #
      # [hostname]
      # format = '[$hostname](bold white)'
      # show_always = true

      username = {
        detect_env_vars = [];
        format = "[$user]($style) on ";
        style_root = "red bold";
        style_user = "#FF7799 bold";
        show_always = true;
        disabled = false;
      };


      hostname = {
        ssh_only = false;
        ssh_symbol = " ";
        trim_at = ".";
        detect_env_vars = [];
        format = "[$ssh_symbol$hostname]($style) in ";
        style = "white dimmed bold";
        disabled = false;
      };
    };
  };
}
