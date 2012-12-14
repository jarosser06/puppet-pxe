class pxe::server::install {
  package { 'dnsmasq':
    ensure   => present,
  }

  package { 'lighttpd':
    ensure   => present,
  }

  package { 'syslinux':
    ensure   => present,
  } 

  if $operatingsystem == 'fedora' {
    package { 'syslinux-tftpboot':
      ensure  => present,
    }
  }
}
