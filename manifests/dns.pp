class pxe::dns {
  include concat::setup
  
  concat { '/etc/dnsmasq.conf':
    owner     => root,
    group     => root,
    mode      => 644,
    notify    => Service['dnsmasq'],
  }

}

