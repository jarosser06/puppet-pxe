define pxe::image (
  $os_name = 'ubuntu',
  $os_version = '12.04',
  $processor_type = 'i386',
  $ensure = 'present',
) {
  
  $base_dir = '/var/ftpd'
  $destination = "${os_name}_${os_version}_${processor_type}"
  
  if $ensure == 'present' {
     
  } else if $ensure == 'absent' {
    
    file { "/var/ftpd/${destination}":
      ensure  => absent,
      recurse => true,
      force   => true,
    }
 } 
