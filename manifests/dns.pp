class pxe::dns {
  include concat::setup
  
  concat { '/etc/dnsmasq.conf':
    owner     => root,
    group     => root,
    mode      => 644,
    notify    => Service['dnsmasq'],
  }
}

define pxe::dns::header (
  $domain,
  $range,
  $ignore = '',
  $dhcp_boot = '',
  $tftp_root = '',
  $options = '',
  $order = 01,
) {
  concat::fragment { "dnsmasq_header":
    target    => "/etc/dnsmasq.conf",
    order     => $order,
    content   => template("pxe/dns_config_header.erb"),
  }
}
 
define pxe::dns::host (
  $mac_address,
  $host_name,
  $ip_address,
  $lease_time,
  $order = 10,  
) {
  concat::fragment { "dnsmasq_host_${mac_address}":
    target    => "/etc/dnsmasq.conf",
    order     => $order,
    content   => template("pxe/dns_config_host.erb"),
  }
}

define pxe::dns::option (
  $option_type,
  $option_args = '',
  $order = 30,
) {
  concat::fragment { "dnsmasq_option_${option_type}":
    target    => "/etc/dnsmasq.conf",
    order     => $order,
    content   => template("pxe/dns_config_option.erb"),
  }
}
