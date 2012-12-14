class pxe::menu::config { 
  $tftp_root = $::pxe::tftp_root 

  file { $tftp_root:
    ensure   => directory,
    owner    => root,
    group    => admin,
    mode     => 775,
  }

  file { "$tftp_root/pxelinux.cfg":
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
    require  => File[$tftp_root],
  }

  file { "$tftp_root/pxelinux.cfg/menu.c32":
    ensure   => present,
    owner    => root,
    group    => admin,
    mode     => 775,
    source   => '/usr/lib/syslinux/menu.c32',
    require  => File["$tftp_root/pxelinux.cfg"],
  }

} 
