class pxe::menu { 
  include concat::setup
  $tftp_root = $::pxe::tftp_root
  $menufile="${tftp_root}/pxelinux.cfg/default'
 
  file { $tftp_root:
    ensure   => directory,
    owner    => root,
    group    => admin,
    mode     => 775,
  }

  file { "${tftp_root}/pxelinux.cfg":
    ensure   => directory,
    owner    => root,
    group    => admin,
    mode     => 775,
    require  => File[$tftp_root],
  }
  
  file { "$tftp_root/pxelinux.0":
    ensure   => present,
    owner    => root,
    group    => admin,
    mode     => 775,
    source   => '/usr/lib/syslinux/pxelinux.0',
    require  => File['/var/ftpd'],
  }

  file { "${tftp_root}/pxelinux.cfg/menu.c32":
    ensure   => present,
    owner    => root,
    group    => admin,
    mode     => 775,
    source   => '/usr/lib/syslinux/menu.c32',
    require  => File["${tftp_root}/pxelinux.cfg"],
  }

  concat { $menufile:
    owner    => root,
    group    => root,
    mode     => 644,
  }
} 

define pxe::menu::header (
  $title   = "PXE Boot Menu",
  $menu_timeout = "1000",
  $order   = 01,
) { 
  concat::fragment { "menu_header":
    target    => "${::pxe::tftp_root}/pxelinux.cfg/default",
    order     => $order, 
    content   => template("pxe/pxe_menu_header.erb"),
  }
} 

define pxe::menu::item (
  $label,
  $kernel,
  $append,
  $order = 10,
) {
  concat::fragment { "menu_item_${label}":
    target    => "${::pxe::tftp_root}/pxelinux.cfg/default",
    order     => $order,
    content   => template("pxe/pxe_menu_host.erb"),
  }
}
