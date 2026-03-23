{ pkgs , inputs,  ... } :{
  home.packages = with pkgs; [

# core system
    coreutils-full
		findutils
    git
    git-lfs
    dconf

# binary
    binutils
    file
    gdb
    gef

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
		inotify-tools

# system viewer
    htop
    atop
    # neofetch , since unmaintained
    fastfetch
    cyme
		nix-tree

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
    # helvum , unmaintained too
		crosspipe # helvum alternative
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

# hex
		hexdump
		hexyl
		hex
		hexedit
		hextazy


# extra
    gh
		libreoffice-fresh
		obs-studio
		blender
    inputs.swww.packages.${pkgs.stdenv.hostPlatform.system}.swww
		# inputs.caelestia-shell.packages.${pkgs.stdenv.hostPlatform.system}.default

# messaging
    weechat
		halloy


		quickshell
  ];
}
