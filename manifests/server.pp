class pxe::server {
  include pxe::server::pxe
  include pxe::server::config
  include pxe::server::service
}
