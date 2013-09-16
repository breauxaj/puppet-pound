class pound {
  $required = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'Pound',
  }

  package { $required: ensure => latest }

  group { 'pound':
    ensure => present,
    gid    => 200,
  }

  user { 'pound':
    ensure     => present,
    gid        => 200,
    home       => '/var/lib/pound',
    shell      => '/sbin/nologin',
    managehome => true,
    uid        => 200,
  }

}

class pound::service ( $ensure = running,
                       $enable = true ) {
  $service = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'pound',
  }
    
  service { $service:
    ensure => $ensure,
    enable => $emable,
  }

}

define pound::config ( $pemfile ) {
  $service = $operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => 'pound',
  }

  $config = $operatingsystem ? {
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
