define pxe::image::install(
  $os_name,
  $os_version,
  $os_arch,
  $final_dir = "$::pxe::tftp_root/netboot/${os_name}_${os_version}_${os_arch}"

) {

  file { "$::pxe::tftp_root/netboot" :
    ensure  => directory,
    mode    => 775,
    user    => 'root',
    group   => 'admin',
  }

  case $operatingsystem {
    ubuntu: {
      if $operatingsystemrelease <= 10.04 {
        $wget_path = "/bin/"
      } else {
        $wget_path = "/usr/bin/"
      }
    }
  } 

  $tmp_dir = "/tmp/${os_name}_${os_version}_${os_arch}"

  case $os_name {
    ubuntu: {
      $uri = "http://archive.ubuntu.com/ubuntu/dists/${os_version}/main/installer-${os_arch}/current/images/netboot/netboot.tar.gz"
    }
    default: { fail("Unrecognized operating system for netboot installer") }
  }

  exec{ "wget $uri":
    command => "${wget_path}wget -q '$url' -P $tmp_dir ",
    timeout => $timeout,
  }

  exec { "unzip $uri":
    command => "/bin/tar -xf $tmp_dir/netboot.tar.gz",
    cwd     => $tmp_dir,
    timeout => 30,
    require => Exec["wget $uri"],
  }

  file { $final_dir:
    ensure  => directory,
    recurse => true,
    owner   => root,
    group   => root,
    mode    => 575,
    source  => "${tmp_dir}/ubuntu-installer",
    require => Exec["unzip ${uri}"],
  }
}
