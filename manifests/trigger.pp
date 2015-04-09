# class udevnet::trigger
class udevnet::trigger {
    exec { 'udevadm trigger':
    refreshonly => true,
    path        => '/sbin',
  }
}
