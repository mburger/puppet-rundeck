class rundeck::tc_webapp {

  # PostgreSQL implementation
  require yum::repo::pgdg92
  $package = 'postgresql92-jdbc'

  if ! defined(Package["$package"]) {
    package { "$package":
      ensure => installed,
    }
  }
  
  file { "/jumio/data/${instance}/lib/postgresql92-jdbc.jar":
    ensure => link,
    target => '/usr/share/java/postgresql92-jdbc.jar',
  }


  
}
