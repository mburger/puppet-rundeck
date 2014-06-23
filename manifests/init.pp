# = Class: rundeck
#
# This is the main rundeck class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, rundeck class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $rundeck_myclass
#
# [*dependency_class*]
#   Name of the class that provides third module dependencies
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, rundeck main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $rundeck_source
#
# [*source_dir*]
#   If defined, the whole rundeck configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $rundeck_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $rundeck_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, rundeck main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $rundeck_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $rundeck_options
#
# [*service_autorestart*]
#   Automatically restarts the rundeck service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $rundeck_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $rundeck_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $rundeck_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $rundeck_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for rundeck checks
#   Can be defined also by the (top scope) variables $rundeck_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $rundeck_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $rundeck_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $rundeck_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $rundeck_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for rundeck port(s)
#   Can be defined also by the (top scope) variables $rundeck_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling rundeck. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $rundeck_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $rundeck_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $rundeck_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $rundeck_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: undef
#
# Default class params - As defined in rundeck::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of rundeck package
#
# [*service*]
#   The name of rundeck service
#
# [*service_status*]
#   If the rundeck service init script supports status argument
#
# [*process*]
#   The name of rundeck process
#
# [*process_args*]
#   The name of rundeck arguments. Used by puppi and monitor.
#   Used only in case the rundeck process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user rundeck runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*http_port*]
#   The listening http_port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $rundeck_http_port
#
# [*https_port*]
#   The listening https_port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $rundeck_https_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $rundeck_protocol
#
#
# See README for usage patterns.
#
class rundeck (
  $my_class                                   = params_lookup( 'my_class' ),
  $dependency_class                           = params_lookup( 'dependency_class' ),
  $source                                     = params_lookup( 'source' ),
  $source_dir                                 = params_lookup( 'source_dir' ),
  $source_dir_purge                           = params_lookup( 'source_dir_purge' ),
  $template                                   = params_lookup( 'template' ),
  $service_autorestart                        = params_lookup( 'service_autorestart' , 'global' ),
  $options                                    = params_lookup( 'options' ),
  $version                                    = params_lookup( 'version' ),
  $absent                                     = params_lookup( 'absent' ),
  $disable                                    = params_lookup( 'disable' ),
  $disableboot                                = params_lookup( 'disableboot' ),
  $monitor                                    = params_lookup( 'monitor' , 'global' ),
  $monitor_tool                               = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target                             = params_lookup( 'monitor_target' , 'global' ),
  $puppi                                      = params_lookup( 'puppi' , 'global' ),
  $puppi_helper                               = params_lookup( 'puppi_helper' , 'global' ),
  $firewall                                   = params_lookup( 'firewall' , 'global' ),
  $firewall_tool                              = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src                               = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst                               = params_lookup( 'firewall_dst' , 'global' ),
  $debug                                      = params_lookup( 'debug' , 'global' ),
  $audit_only                                 = params_lookup( 'audit_only' , 'global' ),
  $noops                                      = params_lookup( 'noops' ),
  $package                                    = params_lookup( 'package' ),
  $service                                    = params_lookup( 'service' ),
  $service_status                             = params_lookup( 'service_status' ),
  $process                                    = params_lookup( 'process' ),
  $process_args                               = params_lookup( 'process_args' ),
  $process_user                               = params_lookup( 'process_user' ),
  $config_dir                                 = params_lookup( 'config_dir' ),
  $config_file                                = params_lookup( 'config_file' ),
  $config_file_mode                           = params_lookup( 'config_file_mode' ),
  $config_file_owner                          = params_lookup( 'config_file_owner' ),
  $config_file_group                          = params_lookup( 'config_file_group' ),
  $config_file_admin_aclpolicy                = params_lookup( 'config_file_admin_aclpolicy' ),
  $config_file_admin_aclpolicy_source         = params_lookup( 'config_file_admin_aclpolicy_source' ),
  $config_file_admin_aclpolicy_template       = params_lookup( 'config_file_admin_aclpolicy_template' ),
  $config_file_apitoken_aclpolicy             = params_lookup( 'config_file_apitoken_aclpolicy' ),
  $config_file_apitoken_aclpolicy_source      = params_lookup( 'config_file_apitoken_aclpolicy_source' ),
  $config_file_apitoken_aclpolicy_template    = params_lookup( 'config_file_apitoken_aclpolicy_template' ),
  $config_file_framework_properties           = params_lookup( 'config_file_framework_properties' ),
  $config_file_framework_properties_source    = params_lookup( 'config_file_framework_properties_source' ),
  $config_file_framework_properties_template  = params_lookup( 'config_file_framework_properties_template' ),
  $config_file_jaas_loginmodule_conf          = params_lookup( 'config_file_jaas_loginmodule_conf' ),
  $config_file_jaas_loginmodule_conf_source   = params_lookup( 'config_file_jaas_loginmodule_conf_source' ),
  $config_file_jaas_loginmodule_conf_template = params_lookup( 'config_file_jaas_loginmodule_conf_template' ),
  $config_file_log4j_properties               = params_lookup( 'config_file_log4j_properties' ),
  $config_file_log4j_properties_source        = params_lookup( 'config_file_log4j_properties_source' ),
  $config_file_log4j_properties_template      = params_lookup( 'config_file_log4j_properties_template' ),
  $config_file_profile                        = params_lookup( 'config_file_profile' ),
  $config_file_profile_source                 = params_lookup( 'config_file_profile_source' ),
  $config_file_profile_template               = params_lookup( 'config_file_profile_template' ),
  $config_file_project_properties             = params_lookup( 'config_file_project_properties' ),
  $config_file_project_properties_source      = params_lookup( 'config_file_project_properties_source' ),
  $config_file_project_properties_template    = params_lookup( 'config_file_project_properties_template' ),
  $config_file_realm_properties               = params_lookup( 'config_file_realm_properties' ),
  $config_file_realm_properties_source        = params_lookup( 'config_file_realm_properties_source' ),
  $config_file_realm_properties_template      = params_lookup( 'config_file_realm_properties_template' ),
  $config_file_ssl_properties                 = params_lookup( 'config_file_ssl_properties' ),
  $config_file_ssl_properties_source          = params_lookup( 'config_file_ssl_properties_source' ),
  $config_file_ssl_properties_template        = params_lookup( 'config_file_ssl_properties_template' ),
  $pid_file                                   = params_lookup( 'pid_file' ),
  $data_dir                                   = params_lookup( 'data_dir' ),
  $log_dir                                    = params_lookup( 'log_dir' ),
  $log_file                                   = params_lookup( 'log_file' ),
  $http_port                                  = params_lookup( 'http_port' ),
  $https_port                                 = params_lookup( 'https_port' ),
  $protocol                                   = params_lookup( 'protocol' ),
  $db_type                                    = params_lookup( 'db_type' ),
  $db_host                                    = params_lookup( 'db_host' ),
  $db_port                                    = params_lookup( 'db_port' ),
  $db_name                                    = params_lookup( 'db_name' ),
  $db_user                                    = params_lookup( 'db_user' ),
  $db_password                                = params_lookup( 'db_password' )
  ) inherits rundeck::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)

  ### Definition of some variables used in the module
  $manage_package = $rundeck::bool_absent ? {
    true  => 'absent',
    false => $rundeck::version,
  }

  $manage_service_enable = $rundeck::bool_disableboot ? {
    true    => false,
    default => $rundeck::bool_disable ? {
      true    => false,
      default => $rundeck::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $rundeck::bool_disable ? {
    true    => 'stopped',
    default =>  $rundeck::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $rundeck::bool_service_autorestart ? {
    true    => Service[rundeck],
    false   => undef,
  }

  $manage_file = $rundeck::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $rundeck::bool_absent == true
  or $rundeck::bool_disable == true
  or $rundeck::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $rundeck::bool_absent == true
  or $rundeck::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $rundeck::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $rundeck::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $rundeck::source ? {
    ''        => undef,
    default   => $rundeck::source,
  }

  $manage_file_content = $rundeck::template ? {
    ''        => undef,
    default   => template($rundeck::template),
  }

  $manage_config_file_admin_aclpolicy_source = $rundeck::config_file_admin_aclpolicy_source ? {
    ''        => undef,
    default   => $rundeck::config_file_admin_aclpolicy_source,
  }

  $manage_config_file_admin_aclpolicy_template = $rundeck::config_file_admin_aclpolicy_template ? {
    ''        => undef,
    default   => template($rundeck::config_file_admin_aclpolicy_template),
  }

  $manage_config_file_apitoken_aclpolicy_source = $rundeck::config_file_apitoken_aclpolicy_source ? {
    ''        => undef,
    default   => $rundeck::config_file_apitoken_aclpolicy_source,
  }

  $manage_config_file_apitoken_aclpolicy_template = $rundeck::config_file_apitoken_aclpolicy_template ? {
    ''        => undef,
    default   => template($rundeck::config_file_apitoken_aclpolicy_template),
  }

  $manage_config_file_framework_properties_source = $rundeck::config_file_framework_properties_source ? {
    ''        => undef,
    default   => $rundeck::config_file_framework_properties_source,
  }

  $manage_config_file_framework_properties_template = $rundeck::config_file_framework_properties_template ? {
    ''        => undef,
    default   => template($rundeck::config_file_framework_properties_template),
  }

  $manage_config_file_jaas_loginmodule_conf_source = $rundeck::config_file_jaas_loginmodule_conf_source ? {
    ''        => undef,
    default   => $rundeck::config_file_jaas_loginmodule_conf_source,
  }

  $manage_config_file_jaas_loginmodule_conf_template = $rundeck::config_file_jaas_loginmodule_conf_template ? {
    ''        => undef,
    default   => template($rundeck::config_file_jaas_loginmodule_conf_template),
  }

  $manage_config_file_log4j_properties_source = $rundeck::config_file_log4j_properties_source ? {
    ''        => undef,
    default   => $rundeck::config_file_log4j_properties_source,
  }

  $manage_config_file_log4j_properties_template = $rundeck::config_file_log4j_properties_template ? {
    ''        => undef,
    default   => template($rundeck::config_file_log4j_properties_template),
  }

  $manage_config_file_profile_source = $rundeck::config_file_profile_source ? {
    ''        => undef,
    default   => $rundeck::config_file_profile_source,
  }

  $manage_config_file_profile_template = $rundeck::config_file_profile_template ? {
    ''        => undef,
    default   => template($rundeck::config_file_profile_template),
  }

  $manage_config_file_project_properties_source = $rundeck::config_file_project_properties_source ? {
    ''        => undef,
    default   => $rundeck::config_file_project_properties_source,
  }

  $manage_config_file_project_properties_template = $rundeck::config_file_project_properties_template ? {
    ''        => undef,
    default   => template($rundeck::config_file_project_properties_template),
  }

  $manage_config_file_realm_properties_source = $rundeck::config_file_realm_properties_source ? {
    ''        => undef,
    default   => $rundeck::config_file_realm_properties_source,
  }

  $manage_config_file_realm_properties_template = $rundeck::config_file_realm_properties_template ? {
    ''        => undef,
    default   => template($rundeck::config_file_realm_properties_template),
  }

  $manage_config_file_ssl_properties_source = $rundeck::config_file_ssl_properties_source ? {
    ''        => undef,
    default   => $rundeck::config_file_ssl_properties_source,
  }

  $manage_config_file_ssl_properties_template = $rundeck::config_file_ssl_properties_template ? {
    ''        => undef,
    default   => template($rundeck::config_file_ssl_properties_template),
  }


  ### Include custom class if $my_class is set
  if $rundeck::my_class {
    include $rundeck::my_class
  }

  ### Include dependencies provided by other modules
  if $rundeck::dependency_class {
    require $rundeck::dependency_class
  }

  ### Managed resources
  case $rundeck::bool_absent {
    true: {
      class { 'rundeck::service': } ->
      class { 'rundeck::config': } ->
      class { 'rundeck::install': } ->
      Class['rundeck']
    }
    false:{
      class { 'rundeck::install': } ->
      class { 'rundeck::config': } ~>
      class { 'rundeck::service': } ->
      Class['rundeck']
    }
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $rundeck::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'rundeck':
      ensure    => $rundeck::manage_file,
      variables => $classvars,
      helper    => $rundeck::puppi_helper,
      noop      => $rundeck::noops,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $rundeck::bool_monitor == true {
    if $rundeck::port != '' {
      monitor::port { "rundeck_${rundeck::protocol}_${rundeck::port}":
        protocol => $rundeck::protocol,
        port     => $rundeck::port,
        target   => $rundeck::monitor_target,
        tool     => $rundeck::monitor_tool,
        enable   => $rundeck::manage_monitor,
        noop     => $rundeck::noops,
      }
    }
    if $rundeck::service != '' {
      monitor::process { 'rundeck_process':
        process  => $rundeck::process,
        service  => $rundeck::service,
        pidfile  => $rundeck::pid_file,
        user     => $rundeck::process_user,
        argument => $rundeck::process_args,
        tool     => $rundeck::monitor_tool,
        enable   => $rundeck::manage_monitor,
        noop     => $rundeck::noops,
      }
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $bool_firewall == true {
    if $http_port != '' {
      firewall { "rundeck_${rundeck::protocol}_${rundeck::http_port}":
        source      => $rundeck::firewall_src,
        destination => $rundeck::firewall_dst,
        protocol    => $rundeck::protocol,
        port        => $rundeck::http_port,
        action      => 'allow',
        direction   => 'input',
        tool        => $rundeck::firewall_tool,
        enable      => $rundeck::manage_firewall,
        noop        => $rundeck::noops,
      }
    }
    if $https_port != '' {
      firewall { "rundeck_${rundeck::protocol}_${rundeck::https_port}":
        source      => $rundeck::firewall_src,
        destination => $rundeck::firewall_dst,
        protocol    => $rundeck::protocol,
        port        => $rundeck::https_port,
        action      => 'allow',
        direction   => 'input',
        tool        => $rundeck::firewall_tool,
        enable      => $rundeck::manage_firewall,
        noop        => $rundeck::noops,
      }
    }
  }

  ### Manage database
  case $rundeck::db_type {
    postgresql: {
      include rundeck::postgresql
    }
    default: { }
  }

  ### Debugging, if enabled ( debug => true )
  if $rundeck::bool_debug == true {
    file { 'debug_rundeck':
      ensure  => $rundeck::manage_file,
      path    => "${settings::vardir}/debug-rundeck",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
      noop    => $rundeck::noops,
    }
  }

}
