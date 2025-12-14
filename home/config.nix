{... }: {

  imports = [
    ./programs/bat.nix
    ./programs/fzf.nix
    ./programs/imv.nix
    ./programs/lsd.nix
    ./programs/mpv.nix
    ./programs/btop.nix
    ./programs/fish.nix
    ./programs/rofi.nix
    ./programs/tmux.nix
    ./programs/kitty.nix
    ./programs/bottom.nix
    ./programs/lazygit.nix
    ./programs/direnv.nix
    ./programs/zoxide.nix
    ./programs/firefox.nix
    ./programs/ripgrep.nix
    ./programs/hyprland.nix
    ./programs/starship.nix
    ./programs/swaylock.nix
    ./programs/waybar/config.nix
		./programs/neovim.nix
		./programs/ssh.nix

    ./programs/extra.nix

    ./services/dunst.nix

    ./desktop/gtk.nix
    ./desktop/xdg.nix
    ./desktop/dcong.nix
    ./desktop/home.nix
  ];

  # services.ssh-agent.enable = true;
  # programs.ssh.startAgent = true;



  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "25.05";
}
