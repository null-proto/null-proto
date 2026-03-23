{ pkgs , ... } :
let
# same as `services.create_ap` but manual
#

  wifi-iface = "wlo1";
  virtual-iface = "hotspot";

	service-name = "hotspot";
in{

	networking = {
		interfaces.${virtual-iface} = {
			ipv4.addresses = [
				{
					address = "10.0.7.1";
					prefixLength = 24;
				}
			];
		};

		nat = {
			enable = true;
			internalInterfaces = [ virtual-iface ];
			externalInterface = wifi-iface;
		};
	};

	systemd.services = {
		${service-name} = {
			description = "Create AP interface";
			serviceConfig = {
				Type = "oneshot";
				ExecStart = "${pkgs.iw}/bin/iw dev ${wifi-iface} interface add ${virtual-iface} type __ap";
				ExecStop = "${pkgs.iw}/bin/iw dev ${virtual-iface} del";
				RemainAfterExit = true;
			};
		};

		hostapd = {
			after = [ "${service-name}.service" ];
			requires = [ "${service-name}.service" ];
			wantedBy = [ ];
		};

		dnsmasq = {
			after = [ "hostapd.service" ];
			requires = [ "hostapd.service" ];
			partOf = [ "hostapd.service" ];
		};
	};

	services = {
		hostapd = {
			enable = true;

			radios.${virtual-iface} = {
				band = "2g";
				channel = 0; # Enable automatic channel selection (ACS). Use only if your hardware supports it.
				# countryCode = "US";

				wifi6.enable = true;
				networks.wlp3s0 = {
					ssid = "Nix NAT AP 2.5G";
					authentication.mode = "none";
				};
			};
		};

		dnsmasq = {
			enable = true;
			settings = {
				interface = virtual-iface;
				dhcp-range = "10.0.7.10,10.0.7.100,12h";
			};
		};
	};
}
