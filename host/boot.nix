{ lib , pkgs, config ,... } : let

  # zfsCompatibleKernelPackages = lib.filterAttrs (
  #   name: kernelPackages:
  #   (builtins.match "linux_[0-9]+_[0-9]+" name) != null
  #   && (builtins.tryEval kernelPackages).success
  #   && ( !(kernelPackages.${pkgs.zfs.kernelModuleAttribute}.meta.broken or false))
  # ) pkgs.linuxKernel.packages;
  #
  # latestKernelPackage = lib.last (
  #   lib.sort (a: b: (lib.versionOlder a.kernel.version b.kernel.version)) (
  #     builtins.attrValues zfsCompatibleKernelPackages
  #   )
  # );

in {
  boot = {
		# supportedFilesystems = [ "zfs" ];
		# zfs.forceImportRoot = false
		
    # see this: https://github.com/nix-community/nixos-images/blob/main/nix/latest-zfs-kernel.nix
		# kernelPackages = lib.mkIf (lib.meta.availableOn pkgs.hostPlatform pkgs.zfs) latestKernelPackage;
		kernelPackages = pkgs.linuxPackages_latest;

		# zfs.enabled = true;

    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 5;

      # enable: if installation
      efi.canTouchEfiVariables = false;
    };
    
    initrd = {
      availableKernelModules = [ "xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [ "i915" "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
    };

    kernelModules = [ "kvm-intel" "zfs" ];
    # extraModulePackages = with config.boot.kernelPackages; [ zfs ];
    blacklistedKernelModules = [ "iwlwifi" ];
    # kernelParams = [ "acpi_osi=\"! Windows 2020\"" ];
    #   extraModprobeConfig = ''
    # # options iwlwifi disable_11ax=1
    # # options iwlwifi power_save=0
    # # options iwlmvm power_scheme=1
    #   # iwlwifi.bt_coex_active=0
    #   '';


  };
}
