# -*- mode: ruby -*-
# vi: set ft=ruby :
class apache2( $document_root ) {

  package { "apache2":
    ensure => "installed"
  } ->
  file { "/etc/apache2/sites-available/vagrant-default":
    content => template("apache2/vhost_default.erb")
  } ->
  file { "/etc/apache2/sites-available/vagrant-default-ssl":
    content => template("apache2/vhost_default-ssl.erb")
  } ->
  file { "/etc/apache2/sites-enabled/000-default":
    ensure => link,
    target => "../sites-available/vagrant-default",
  } ->
  file { "/etc/apache2/sites-enabled/000-default-ssl":
    ensure => link,
    target => "../sites-available/vagrant-default-ssl",
  } -> file_line { "xdebug_remote_enable":
    path => "/etc/php5/conf.d/20-xdebug.ini",
    line => "xdebug.remote_enable = on",
  } -> file_line { "xdebug_remote_connect_back":
    path => "/etc/php5/conf.d/20-xdebug.ini",
    line => "xdebug.remote_connect_back = on",
  } ->
  service { "apache2":
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    subscribe  => File['/etc/apache2/sites-enabled/000-default', '/etc/apache2/sites-enabled/000-default-ssl'],
    require    => Package["apache2"],
  }

}
