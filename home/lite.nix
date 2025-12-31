{ pkgs , inputs , ... } : {
  # Simply install just the packages
  home.packages = with pkgs; [
    procps
    killall
    diffutils
    findutils
    utillinux
    tzdata
    hostname
    man
    ripgrep
    gnupg
    gnused
    gnutar
    bzip2
    gzip
    xz
    zip
    unzip
  ];

  home.shell.enableFishIntegration = true;
  home.stateVersion = "24.05";

  imports = [
    ./programs/bat.nix
    ./programs/fzf.nix
    ./programs/lsd.nix
    ./programs/fish.nix
    ./programs/tmux.nix
    ./programs/direnv.nix
    ./programs/zoxide.nix
    ./programs/ripgrep.nix
    ./programs/starship.nix
    ./programs/starship.nix
    ./programs/ssh.nix
  ];

  xdg = {
    # portal.enable = true;
    configFile.nvim = {
      source = inputs.nvim-config;
      recursive = true;
    };
  };
}
