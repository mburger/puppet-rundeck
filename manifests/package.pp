class rundeck::package (
  $version,
  $java_version,
) {

  require yum::repo::jumio

  package { 'rundeck':
    ensure => $version,
  }

  if ! defined(Package['jre']) {
    package { 'jre':
      ensure => $java_version,
    }
  }

}
