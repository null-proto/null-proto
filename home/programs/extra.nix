{ pkgs , ... } :{
  home.packages = with pkgs; [
    alacritty
    alacritty-theme

    playerctl
    papers
    audacious

    jmtpfs
    lf
    gdb
    gef
    ffmpeg

    hyprpaper
    hyprpicker

    neofetch
    fastfetch
    zoxide
    lsd
    cyme
    typos-lsp
    nautilus
    waybar
    slurp
    grim
    qemu
    gh
    nwg-look
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    wl-clipboard
    cliphist

    yaml-language-server
    vscode-langservers-extracted
    lua-language-server
    fish-lsp
    bash-language-server
    tailwindcss-language-server

    android-studio
  ];
}
