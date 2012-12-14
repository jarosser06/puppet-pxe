define pxe::menu::header (
  $menu_title   = "PXE Boot Menu",
  $menu_timeout = "1000",
  $order        = 01,
) { 
  concat::fragment { "menu_header":
    target    => "$::pxe::tftp_root/pxelinux.cfg/default",
    order     => $order, 
    content   => template("pxe/pxe_menu_header.erb"),
  }
} 
