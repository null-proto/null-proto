{ pkgs,... } : {

  fileSystems = {
		"/tmp" = { 
			device = "tmpfs";
      fsType = "tmpfs";
      options = [ "size=4G" "mode=1777" ];
		};
	};


  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 8;
      efi.canTouchEfiVariables = false;
    };
    
    initrd = {
      availableKernelModules = [ "xhci_pci" "vmd" "nvme" "usbhid" ];
      kernelModules = [ "i915" ];
    };

    kernelModules = [ "kvm-intel" ];
    kernelParams = [ ];

		kernel.sysctl = {
			"vm.swappiness" = 90;
			"net.ipv4.tcp_congestion_control" = "bbr";
		};
  };
}
