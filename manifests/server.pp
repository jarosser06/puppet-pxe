class pxe::server {
  include pxe::server::install
  include pxe::server::config
  include pxe::server::service
}
