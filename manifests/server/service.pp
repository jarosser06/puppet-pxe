class pxe::server::service {
  service { 'lighttpd':
    ensure   => running,
    enable   => true,
  }
  
  service { 'dnsmasq':
    ensure   => running,
    enable   => true,
  }
}
