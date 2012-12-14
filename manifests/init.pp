class pxe ($tftp_root='/srv/tftp') {
  include pxe::server
  include pxe::menu  
  include pxe::dns
}
