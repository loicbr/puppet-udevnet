define udevnet::interface($hwaddress, $trigger = true) {
  if !defined( Class['udevnet'] ) {
    class { 'udevnet': }
  }

  concat::fragment { "udev_network_${name}":
    target => "/etc/udev/rules.d/70puppet-net.rules",
    content => "SUBSYSTEM==\"net\", ACTION==\"add\", ATTR{address}==\"${hwaddress}\", NAME=\"${name}\"\n",
    order => 10,
  }
}
