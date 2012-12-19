class pxe ($tftp_root='/srv/tftp') {

  file { $tftp_root :
    ensure   => directory,
    mode     => 775,
    user     => 'root',
    group    => 'admin',
  }
 
  include pxe::server
  include pxe::menu  
  include pxe::dns
}
