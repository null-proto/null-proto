{ pkgs , ... }: {
  environment.systemPackages = with pkgs; [
    tcpdump
    arping
    netcat

    acpi
    brightnessctl

    htop
    atop
    
    dfrs
    gdu
    
    ripgrep
    tree
    
    openssh
    wget
    curl
    binutils

    docker
    openssh
    openssl

    usbutils
    binutils
    libinput
    coreutils-full
    lsof

    curl
    nmap
    nettools
    iputils

    nixd
    git
    git-lfs
    dconf

    unzip 
    gzip 
    unrar
    xz
    lz4

    btrfs-progs
    btrfs-heatmap 

    #-- un-free & sus
    _7zz
    unrar
  ];
}
