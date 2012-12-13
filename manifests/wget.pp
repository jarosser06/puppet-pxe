define pxe::wget(
  $url,
  $timeout=30,
  $directory,
) {

  exec{ "wget $uri":
    command => "/bin/wget -q '$url' -P $directory",
    timeout => $timeout,
  }
} 
