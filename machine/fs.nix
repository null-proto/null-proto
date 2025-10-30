{}: {
  fileSystems."/" =
    { device = "/dev/disk/by-label/NIX";
      fsType = "btrfs";
      options = [ "subvol=#core" ];
    };

  fileSystems."/tmp" =
    { device = "/dev/disk/by-label/NIX";
      fsType = "btrfs";
      options = [ "subvol=#void" "noatime" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/NIXEFI";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  fileSystems."/root" =
    { device = "/dev/disk/by-label/NIX";
      fsType = "btrfs";
      options = [ "subvol=#ring0" "compress=zstd:1" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-label/NIX";
      fsType = "btrfs";
      options = [ "subvol=#registry" "compress=zstd:1" "noatime" ];
    };

  fileSystems."/nix/store" =
    { device = "/dev/disk/by-label/NIX";
      fsType = "btrfs";
      options = [ "subvol=#store" "compress=zstd:1" "noatime" ];
    };

  fileSystems."/usr" =
    { device = "/dev/disk/by-label/NIX";
      fsType = "btrfs";
      options = [ "subvol=#resources" "compress=zstd:3" ];
    };

  fileSystems."/opt" =
    { device = "/dev/disk/by-label/NIX";
      fsType = "btrfs";
      options = [ "subvol=#optional" "compress=zstd:2" ];
    };

  fileSystems."/var" =
    { device = "/dev/disk/by-label/NIX";
      fsType = "btrfs";
      options = [ "subvol=#variables" "compress=zstd:1" ];
    };

  fileSystems."/etc" =
    { device = "/dev/disk/by-label/NIX";
      fsType = "btrfs";
      options = [ "subvol=#configuration" "compress=zstd:3" "autodefrag" ];
    };

  fileSystems."/etc/nixos" =
    { device = "/dev/disk/by-label/NIX";
      fsType = "btrfs";
      options = [ "subvol=#derivations" "compress=zstd:5" "autodefrag" ];
    };

  fileSystems."/dyn" =
    { device = "/dev/disk/by-label/NIX";
      fsType = "btrfs";
      options = [ "subvol=#dynamics" "compress=zstd:1" ];
    };

  fileSystems."/srv" =
    { device = "/dev/disk/by-label/NIX";
      fsType = "btrfs";
      options = [ "subvol=#serverdata" "compress=zstd:4" ];
    };

  fileSystems."/pag" =
    { device = "/dev/disk/by-label/NIX";
      fsType = "btrfs";
      options = [ "subvol=#pages" "noatime" ];
    };

  swapDevices = [ { device = "/pag/pagefile"; } ];
}
