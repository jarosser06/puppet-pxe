define pxe::menu::host (
  $label      = $title,
  $kernel     = '',
  $append     = '',
  $order      = 10,
  $image      = 'false',
) {
  
  # installs the image if it does not exist
  if $image {
    if !search_netboot_images($kernel) {
      $os_info = parse_host_kernel($kernel)

      pxe::image::install { '$kernel':
        os_name    => $os_info[0],
        os_version => $os_info[1],
        os_arch    => $os_info[2],
      }
    } 

    $os_info = parse_host_kernel($kernel)
    $kernel        = "$::pxe::tftp_root/netboot/$kernel/$os_info[2]/linux"
  }

  
  concat::fragment { "menu_item_${label}":
    target         => "$::pxe::tftp_root/pxelinux.cfg/default",
    order          => $order,
    content        => template("pxe/pxe_menu_host.erb"),
  }
}
