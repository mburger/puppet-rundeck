# Class: rundeck::params
#
# This class defines default parameters used by the main module class rundeck
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to rundeck class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class rundeck::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'rundeck',
  }

  $service = $::operatingsystem ? {
    default => 'rundeckd',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'rundeck',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    default => 'rundeck',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/rundeck',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/rundeck/rundeck-config.properties',
  }

  $config_file_admin_aclpolicy = $::operatingsystem ? {
    default => '/etc/rundeck/admin.aclpolicy',
  }

  $config_file_apitoken_aclpolicy = $::operatingsystem ? {
    default => '/etc/rundeck/apitoken.aclpolicy',
  }

  $config_file_framework_properties = $::operatingsystem ? {
    default => '/etc/rundeck/framework.properties',
  }

  $config_file_jaas_loginmodule_conf = $::operatingsystem ? {
    default => '/etc/rundeck/jaas-loginmodule.conf',
  }

  $config_file_log4j_properties = $::operatingsystem ? {
    default => '/etc/rundeck/log4j.properties',
  }

  $config_file_profile = $::operatingsystem ? {
    default => '/etc/rundeck/profile',
  }

  $config_file_project_properties = $::operatingsystem ? {
    default => '/etc/rundeck/project.properties',
  }

  $config_file_realm_properties = $::operatingsystem ? {
    default => '/etc/rundeck/realm.properties',
  }

  $config_file_ssl_properties = $::operatingsystem ? {
    default => '/etc/rundeck/ssl/ssl.properties',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'rundeck',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'rundeck',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/rundeck.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/var/lib/rundeck/data',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/rundeck',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/rundeck/rundeck.log',
  }

  $http_port = '4440'
  $https_port = ''
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $dependency_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false
  $config_file_admin_aclpolicy_source = ''
  $config_file_admin_aclpolicy_template = ''
  $config_file_apitoken_aclpolicy_source = ''
  $config_file_apitoken_aclpolicy_template = ''
  $config_file_framework_properties_source = ''
  $config_file_framework_properties_template = ''
  $config_file_jaas_loginmodule_conf_source = ''
  $config_file_jaas_loginmodule_conf_template = ''
  $config_file_log4j_properties_source = ''
  $config_file_log4j_properties_template = ''
  $config_file_profile_source = ''
  $config_file_profile_template = ''
  $config_file_project_properties_source = ''
  $config_file_project_properties_template = ''
  $config_file_realm_properties_source = ''
  $config_file_realm_properties_template = ''
  $config_file_ssl_properties_source = ''
  $config_file_ssl_properties_template = ''
  $db_type = 'hsqldb'
  $db_host = 'localhost'
  $db_port = '5432'
  $db_name = 'rundeck'
  $db_user = 'rundeck'
  $db_password = fqdn_rand(100000000000)

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = undef

}
