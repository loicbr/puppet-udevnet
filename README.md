udev persistent network names with Puppet
=========================================

Overview
--------

This module is a work in progress, but is designed mainly to allow the
user to give persistent names to interfaces based on their MAC address
(in the future alternative methods might be provided).

Usage
-----

The `udevnet::interface` type takes the new interface name as name and
the MAC address as the `hwaddress` parameter:

    udevnet::interface { 'wan0':
	  hwaddress => 'ff:de:ad:be:ef:00',
	}

The define will remove `70persistent-net.rules` if present and will
make sure to link `80net-slot-name.rules` to `/dev/null` to make sure
that the new "predictable" names are not used.
