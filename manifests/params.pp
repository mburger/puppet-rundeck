class rundeck::params {

  require jumio::role::base

  $version            = 'present'
  $java_version       = 'present'

  $login_module_name  = 'JumioMultiAuth'
  $login_config       = 'jaas-loginmodule.conf'
  $realm_property     = 'realm.properties'
  $framework_property = 'framework.properties'
  $project_property   = 'project.properties'
  $rd_config_property = 'rundeck-config.properties'
  $log4j_property     = 'log4j.properties'

  $xms                = '256M'
  $xmx                = '512M'

  $rd_url             = 'localhost'
  $rd_user            = 'rundeck'
  $rd_group           = 'rundeck'
  $rd_home            = '/etc/rundeck'
  $rd_base            = '/jumio/data/rundeck'
  $rd_dirs            = [$rd_base,"${rd_base}/tmp","${rd_base}/data","${rd_base}/projects","${rd_base}/logs","${rd_base}/var"]

  $db_server          = 'localhost'
  $db_port            = '5432'
  $db_name            = 'rundeck'
  $db_url_params      = 'ssl=true&sslfactory=org.postgresql.ssl.NonValidatingFactory'
  $db_user            = ''
  $db_pass            = ''

  $aide               = false

}
