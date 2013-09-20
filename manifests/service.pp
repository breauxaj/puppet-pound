class pound::service (
  $ensure = running,
  $enable = true
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'pound',
  }

  service { $service:
    ensure => $ensure,
    enable => $enable,
  }

}
