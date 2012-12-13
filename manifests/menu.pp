class pxe::menu { 
  include concat::setup
  $menufile='/var/ftpd/pxelinux.cfg/default'
 
  file { '/var/ftpd':
    ensure   => directory,
    owner    => root,
    group    => admin,
    mode     => 775,
  }

  file { '/var/ftpd/pxelinux.cfg':
    ensure   => directory,
    owner    => root,
    group    => admin,
    mode     => 775,
    require  => File['/var/ftpd'],
  }
  
  file { '/var/ftpd/pxelinux.0':
    ensure   => present,
    owner    => root,
    group    => admin,
    mode     => 775,
    source   => '/usr/lib/syslinux/pxelinux.0',
    require  => File['/var/ftpd'],
  }

  file { '/var/ftpd/pxelinux.cfg/menu.c32':
    ensure   => present,
    owner    => root,
    group    => admin,
    mode     => 775,
    source   => '/usr/lib/syslinux/menu.c32',
    require  => File['/var/ftpd/pxelinux.cfg'],
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
    target    => "/var/ftpd/pxelinux.cfg/default",
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
    target    => "/var/ftpd/pxelinux.cfg/default",
    order     => $order,
    content   => template("pxe/pxe_menu_item.erb"),
  }
}
