{ ... } : {
  boot = {
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

    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
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
