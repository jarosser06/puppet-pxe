define pxe::dns::host (
  $mac_address,
  $host_name = $title,
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
