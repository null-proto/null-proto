{ pkgs , ... } :{
  home.packages = with pkgs; [
    alacritty
    alacritty-theme

		gimp

		scrcpy

    playerctl
    papers
    audacious
    nautilus

    jmtpfs
    lf
    gdb
    gef
    ffmpeg

		file

		helvum

    hyprpaper
    hyprpicker

    neofetch
    fastfetch
    cyme
    slurp
    grim
    qemu
    gh
    nwg-look

    xdg-desktop-portal
    xdg-desktop-portal-wlr

    wl-clipboard
    cliphist

    typos-lsp
    yaml-language-server
    vscode-langservers-extracted
    lua-language-server
    fish-lsp
    bash-language-server
    tailwindcss-language-server

    android-studio
  ];
}
