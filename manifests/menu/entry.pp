define pxe::menu::entry (
  $label      = $title,
  $kernel     = '',
  $append     = '',
  $order      = 10,
  $image      = 'false',
) {
  
  # installs the image if it does not exist
  # TODO: Add support for append redirection as well
  if $image == true {

    $os_info = parse_entry_kernel($kernel)
    if !search_netboot_images($kernel) {

      pxe::image::install { $kernel:
        os_name    => $os_info[0],
        os_version => $os_info[1],
        os_arch    => $os_info[2],
      }
    } 

    case $os_info[0] {
      ubuntu: { 
        $kernel_loc="$::pxe::tftp_root/netboot/${kernel}/${os_info[2]}/linux"
      }
    }
  } else {
    $kernel_loc = $kernel
  }
  
  concat::fragment { "menu_item_${label}":
    target         => "$::pxe::tftp_root/pxelinux.cfg/default",
    order          => $order,
    content        => template("pxe/pxe_menu_entry.erb"),
  }
}
