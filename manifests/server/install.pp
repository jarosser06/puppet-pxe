class pxe::server::pxe {
  package { 'syslinux':
    ensure   => present,
  }

  package { 'dnsmasq':
    ensure   => present,
  }

  package { 'lighttpd':
    ensure   => present,
  }
}
