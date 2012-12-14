class pxe::server::install {
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
