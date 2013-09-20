class pound {
  $required = $::operatingsystem ? {
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
