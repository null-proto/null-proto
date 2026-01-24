{ pkgs , ... } :{
  home.packages = with pkgs; [

# core system
    coreutils-full
    git
    git-lfs
    dconf

# binary
    binutils
    file
    gdb
    gef

# extra
    gh

# hardware controller utility
    acpi
    brightnessctl
    usbutils
    libinput

# virtualization utility
    docker

# network / encryption utility
    openssl
    wget
    curl
    nmap
    nettools
    iputils
    tcpdump
    arping
    netcat

# text / compression / archive utility
    ripgrep
    unzip 
    gzip 
    xz
    lz4
		jq

# file system / file management  utility
    btrfs-progs
    btrfs-heatmap 
    nautilus
    dfrs
    gdu
    tree
    lsof
    lf

# system viewer
    htop
    atop
    neofetch
    fastfetch
    cyme

# wayland / desktop utility
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    hyprpaper
    hyprpicker
    wl-clipboard
    cliphist
    slurp
    grim
    nwg-look

# audio utility
    helvum
    audacious
    playerctl

# video / photo / document
    ffmpeg
    gimp
    papers

# multi spec
    scrcpy
    jmtpfs


# language server
    nixd
    typos-lsp
    yaml-language-server
    vscode-langservers-extracted
    lua-language-server
    fish-lsp
    bash-language-server
    tailwindcss-language-server

# ide
    android-tools
    # android-studio
  ];
}
