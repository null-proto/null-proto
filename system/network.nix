{ lib , ... } : {


  networking = {
    hostName = "nix";
    networkmanager.enable = true;

		iproute2.enable = true;

		interfaces.lo.ipv4.addresses = [
			{ address = "127.0.0.1"; prefixLength = 8; }
			{ address = "127.0.0.2"; prefixLength = 8; }
		];

		bridges."tornet".interfaces = [];

		interfaces.tornet = {
			name = "tornet";
			useDHCP = false;
			virtual = true;
			virtualType = "tun";
			ipv4.addresses = [ 
			  { address = "10.100.100.1"; prefixLength = 24; }
			];
		};


    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
    useDHCP = lib.mkDefault true;
    # networking.interfaces.eno2.useDHCP = lib.mkDefault true;
    # networking.interfaces.enp0s20f0u5.useDHCP = lib.mkDefault true;
  };
}
