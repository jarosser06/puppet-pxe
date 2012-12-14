define pxe::menu::host (
  $label,
  $kernel,
  $append     ='',
  $order      =10,
) {
  concat::fragment { "menu_item_${label}":
    target    => "$::pxe::tftp_root/pxelinux.cfg/default",
    order     => $order,
    content   => template("pxe/pxe_menu_host.erb"),
  }
}
