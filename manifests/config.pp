define pound::config (
  $pemfile
) {
  $service = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'pound',
  }

  $config = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => '/etc/pound.cfg',
  }

  file { $config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('pound/pound.erb'),
    notify  => Service[$service],
  }

}
