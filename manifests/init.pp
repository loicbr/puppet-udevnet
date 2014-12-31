class udevnet {
  concat { '/etc/udev/rules.d/70puppet-net.rules': }
  concat::fragment { "udev_network_setup_header":
    target => '/etc/udev/rules.d/70puppet-net.rules',
    content => "# Puppet manages this file\n",
    order => 01,
  }

  file { '/etc/udev/rules.d/70persistent-net.rules':
    ensure => absent,
  }

  file { '/etc/udev/rules.d/80-net-name-slot.rules':
    ensure => link,
    target => '/dev/null',
  }
}
