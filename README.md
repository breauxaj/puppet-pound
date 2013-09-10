pound
=====

The Pound program is a reverse proxy, load balancer and HTTPS front-end for
Web server(s).

Samples
-------
```
include pound
```
```
pound::service { 'default': ensure => running, enable => true }
```
```
pound::config { 'default': pemfile => 'web1.pem' }
```
