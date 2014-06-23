# Class: rundeck::config
#
# This class manages rundeck configuration
#
# == Variables
#
# Refer to rundeck class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by rundeck
#
class rundeck::config {

  file { 'rundeck.conf':
    ensure  => $rundeck::manage_file,
    path    => $rundeck::config_file,
    mode    => $rundeck::config_file_mode,
    owner   => $rundeck::config_file_owner,
    group   => $rundeck::config_file_group,
    notify  => $rundeck::manage_service_autorestart,
    source  => $rundeck::manage_file_source,
    content => $rundeck::manage_file_content,
    replace => $rundeck::manage_file_replace,
    audit   => $rundeck::manage_audit,
    noop    => $rundeck::noops,
  }

  if ($rundeck::config_file_admin_aclpolicy_source or $rundeck::config_file_admin_aclpolicy_template) {
    file { 'rundeck.admin.aclpolicy':
      ensure  => $rundeck::manage_file,
      path    => $rundeck::config_file_admin_aclpolicy,
      mode    => $rundeck::config_file_mode,
      owner   => $rundeck::config_file_owner,
      group   => $rundeck::config_file_group,
      source  => $rundeck::manage_config_file_admin_aclpolicy_source,
      content => $rundeck::manage_config_file_admin_aclpolicy_template,
      replace => $rundeck::manage_file_replace,
      audit   => $rundeck::manage_audit,
      noop    => $rundeck::noops,
    }
  }

  if ($rundeck::config_file_apitoken_aclpolicy_source or $rundeck::config_file_apitoken_aclpolicy_template) {
    file { 'rundeck.apitoken.aclpolicy':
      ensure  => $rundeck::manage_file,
      path    => $rundeck::config_file_apitoken_aclpolicy,
      mode    => $rundeck::config_file_mode,
      owner   => $rundeck::config_file_owner,
      group   => $rundeck::config_file_group,
      source  => $rundeck::manage_config_file_apitoken_aclpolicy_source,
      content => $rundeck::manage_config_file_apitoken_aclpolicy_template,
      replace => $rundeck::manage_file_replace,
      audit   => $rundeck::manage_audit,
      noop    => $rundeck::noops,
    }
  }

  if ($rundeck::config_file_framework_properties_source or $rundeck::config_file_framework_properties_template) {
    file { 'rundeck.framework.properties':
      ensure  => $rundeck::manage_file,
      path    => $rundeck::config_file_framework_properties,
      mode    => $rundeck::config_file_mode,
      owner   => $rundeck::config_file_owner,
      group   => $rundeck::config_file_group,
      source  => $rundeck::manage_config_file_framework_properties_source,
      content => $rundeck::manage_config_file_framework_properties_template,
      replace => $rundeck::manage_file_replace,
      audit   => $rundeck::manage_audit,
      noop    => $rundeck::noops,
    }
  }

  if ($rundeck::config_file_jaas_loginmodule_conf_source or $rundeck::config_file_jaas_loginmodule_conf_template) {
    file { 'rundeck.jaas-loginmodule.conf':
      ensure  => $rundeck::manage_file,
      path    => $rundeck::config_file_jaas_loginmodule_conf,
      mode    => $rundeck::config_file_mode,
      owner   => $rundeck::config_file_owner,
      group   => $rundeck::config_file_group,
      source  => $rundeck::manage_config_file_jaas_loginmodule_conf_source,
      content => $rundeck::manage_config_file_jaas_loginmodule_conf_template,
      replace => $rundeck::manage_file_replace,
      audit   => $rundeck::manage_audit,
      noop    => $rundeck::noops,
    }
  }

  if ($rundeck::config_file_log4j_properties_source or $rundeck::config_file_log4j_properties_template) {
    file { 'rundeck.log4j.properties':
      ensure  => $rundeck::manage_file,
      path    => $rundeck::config_file_log4j_properties,
      mode    => $rundeck::config_file_mode,
      owner   => $rundeck::config_file_owner,
      group   => $rundeck::config_file_group,
      source  => $rundeck::manage_config_file_log4j_properties_source,
      content => $rundeck::manage_config_file_log4j_properties_template,
      replace => $rundeck::manage_file_replace,
      audit   => $rundeck::manage_audit,
      noop    => $rundeck::noops,
    }
  }

  if ($rundeck::config_file_profile_source or $rundeck::config_file_profile_template) {
    file { 'rundeck.profile':
      ensure  => $rundeck::manage_file,
      path    => $rundeck::config_file_profile,
      mode    => $rundeck::config_file_mode,
      owner   => $rundeck::config_file_owner,
      group   => $rundeck::config_file_group,
      source  => $rundeck::manage_config_file_profile_source,
      content => $rundeck::manage_config_file_profile_template,
      replace => $rundeck::manage_file_replace,
      audit   => $rundeck::manage_audit,
      noop    => $rundeck::noops,
    }
  }

  if ($rundeck::config_file_project_properties_source or $rundeck::config_file_project_properties_template) {
    file { 'rundeck.project.properties':
      ensure  => $rundeck::manage_file,
      path    => $rundeck::config_file_project_properties,
      mode    => $rundeck::config_file_mode,
      owner   => $rundeck::config_file_owner,
      group   => $rundeck::config_file_group,
      source  => $rundeck::manage_config_file_project_properties_source,
      content => $rundeck::manage_config_file_project_properties_template,
      replace => $rundeck::manage_file_replace,
      audit   => $rundeck::manage_audit,
      noop    => $rundeck::noops,
    }
  }

  if ($rundeck::config_file_realm_properties_source or $rundeck::config_file_realm_properties_template) {
    file { 'rundeck.realm.properties':
      ensure  => $rundeck::manage_file,
      path    => $rundeck::config_file_realm_properties,
      mode    => $rundeck::config_file_mode,
      owner   => $rundeck::config_file_owner,
      group   => $rundeck::config_file_group,
      source  => $rundeck::manage_config_file_realm_properties_source,
      content => $rundeck::manage_config_file_realm_properties_template,
      replace => $rundeck::manage_file_replace,
      audit   => $rundeck::manage_audit,
      noop    => $rundeck::noops,
    }
  }

  if ($rundeck::config_file_ssl_properties_source or $rundeck::config_file_ssl_properties_template) {
    file { 'rundeck.ssl.properties':
      ensure  => $rundeck::manage_file,
      path    => $rundeck::config_file_ssl_properties,
      mode    => $rundeck::config_file_mode,
      owner   => $rundeck::config_file_owner,
      group   => $rundeck::config_file_group,
      source  => $rundeck::manage_config_file_ssl_properties_source,
      content => $rundeck::manage_config_file_ssl_properties_template,
      replace => $rundeck::manage_file_replace,
      audit   => $rundeck::manage_audit,
      noop    => $rundeck::noops,
    }
  }

  # The whole rundeck configuration directory can be recursively overriden
  if $rundeck::source_dir {
    file { 'rundeck.dir':
      ensure  => directory,
      path    => $rundeck::config_dir,
      notify  => $rundeck::manage_service_autorestart,
      source  => $rundeck::source_dir,
      recurse => true,
      purge   => $rundeck::bool_source_dir_purge,
      force   => $rundeck::bool_source_dir_purge,
      replace => $rundeck::manage_file_replace,
      audit   => $rundeck::manage_audit,
      noop    => $rundeck::noops,
    }
  }
}
