define pxe::dns::header (
  $domain    = 'example.com',
  $range     = '0.0.0.0,static',
  $ignore    = '',
  $dhcp_boot = 'pxelinux.0',
  $tftp_root = $::pxe::tftp_root,
  $options   = '',
  $order     = 01,
) {
  concat::fragment { "dnsmasq_header":
    target    => "/etc/dnsmasq.conf",
    order     => $order,
    content   => template("pxe/dns_config_header.erb"),
  }
}
