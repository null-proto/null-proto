{... }: {

  imports = [
    ./programs/bat.nix
    ./programs/bottom.nix
    ./programs/btop.nix
    ./programs/direnv.nix
    ./programs/firefox.nix
    ./programs/fish.nix
    ./programs/fzf.nix
    ./programs/hyprland.nix
    ./programs/hyprlock.nix
    ./programs/imv.nix
    ./programs/kitty.nix
    ./programs/lazygit.nix
    ./programs/lsd.nix
    ./programs/mpv.nix
    ./programs/neovim.nix
		./programs/office.nix
    ./programs/ripgrep.nix
    ./programs/rofi.nix
    ./programs/ssh.nix
    ./programs/starship.nix
    ./programs/tmux.nix
    ./programs/waybar/config.nix
    ./programs/zoxide.nix
		# ./programs/caelestia.nix

    ./programs/extra.nix

    ./services/dunst.nix
		./services/wm.nix

    ./desktop/dcong.nix
    ./desktop/gtk.nix
    ./desktop/home.nix
    ./desktop/xdg.nix

  ];
  # services.ssh-agent.enable = true;
  # programs.ssh.startAgent = true;


  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "25.11";
}
