{ pkgs , ... }: {
  environment.systemPackages = with pkgs; [
    zfs
    zfstools
    qemu
    wl-clipboard
    man-pages
    man-db
    man
  ];
}
