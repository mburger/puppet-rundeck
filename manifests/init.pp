class rundeck (
  $rd_admin_user,
  $rd_admin_pass,
  $db_user,
  $db_pass,
  $db_server     = $rundeck::params::db_server,
  $db_port       = $rundeck::params::db_port,
  $db_name       = $rundeck::params::db_name,
  $db_url_params = $rundeck::params::db_url_params,
  $xms           = $rundeck::params::xms,
  $xmx           = $rundeck::params::xmx,
  $rd_base       = $rundeck::params::rd_base,
  $rd_url        = $rundeck::params::rd_url,
  $version       = $rundeck::params::version,
  $java_version  = $rundeck::params::java_version,
  $aide          = $rundeck::params::aide,

) inherits rundeck::params {

  class { 'rundeck::package':
    version      => $version,
    java_version => $java_version,
  } ->

  class { 'rundeck::config': 
    rd_admin_user => $rd_admin_user,
    rd_admin_pass => $rd_admin_pass,
    db_user       => $db_user,
    db_pass       => $db_pass,
    rd_url        => $rd_url,
    db_server     => $db_server,
    db_port       => $db_port,
    db_name       => $db_name,
    db_url_params => $db_url_params,
    xms           => $xms,
    xmx           => $xmx,
    rd_base       => $rd_base,
    aide          => $aide
  } ~>
  
  class { 'rundeck::service': }

}
