{ ... }:
{
  virtualisation = {
    # waydroid.enable = true;
    # spiceUSBRedirection.enable = true;
    # libvirtd.enable = true;
  };

  # support for other cup arch
  boot.binfmt = {
		emulatedSystems = [
			"aarch64-linux"
			"armv7l-linux"
			"i686-linux"
			"riscv64-linux"
		];

		preferStaticEmulators = true;
	};

}
