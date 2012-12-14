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
