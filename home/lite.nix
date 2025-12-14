{ pkgs , inputs , ...} : {
  # Simply install just the packages
  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
    neovim # or some other editor, e.g. nano or neovim

    # Some common stuff that people expect to have
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

  imports = [
    ./home/programs/bat.nix
    ./home/programs/fzf.nix
    ./home/programs/lsd.nix
    ./home/programs/fish.nix
    ./home/programs/tmux.nix
    ./home/programs/direnv.nix
    ./home/programs/zoxide.nix
    ./home/programs/ripgrep.nix
    ./home/programs/starship.nix
  ];

  xdg = {
    # portal.enable = true;
    configFile.nvim = {
      source = inputs.nvim-config;
      recursive = true;
    };
  };
}
