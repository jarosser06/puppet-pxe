class pxe::menu { 
  include pxe::menu::config
  include concat::setup
  $menufile  = "$::pxe::tftp_root/pxelinux.cfg/default"

  concat { $menufile:
    owner    => root,
    group    => root,
    mode     => 644,
  }

} 
