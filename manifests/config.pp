class rundeck::config (
  $rd_admin_user,
  $rd_admin_pass,
  $db_user,
  $db_pass,
  $db_server,
  $db_port,
  $db_name,
  $db_url_params,
  $xms,
  $xmx,
  $rd_base,
  $rd_url,
  $aide,
) inherits rundeck::params {
  
  $login_module_name  = $rundeck::params::login_module_name
  $login_config       = $rundeck::params::login_config
  $realm_property     = $rundeck::params::realm_property
  $framework_property = $rundeck::params::framework_property
  $project_property   = $rundeck::params::project_property
  $rd_config_property = $rundeck::params::rd_config_property
  $log4j_property     = $rundeck::params::log4j_property
  $rd_user            = $rundeck::params::rd_user
  $rd_group           = $rundeck::params::rd_group
  $rd_home            = $rundeck::params::rd_home
  $rd_dirs            = $rundeck::params::rd_dirs

  $rd_admin_pass_hash = md5($rd_admin_pass)

  file { $rd_dirs:
    ensure => directory,
    owner  => $rd_user,
    group  => $rd_group,
  }

  file { "$rd_home":
    ensure  => directory,
    owner   => $rd_user,
    group   => $rd_group,
    recurse => true,
    purge   => true,
    source  => 'puppet:///modules/rundeck/conf'
  }

  file { "${rd_home}/profile":
    ensure  => file,
    owner   => 'root',
    group   => $rd_group,
    mode    => '0440',
    content => template('rundeck/profile.erb'),
  }
  
  file { "${rd_home}/${login_config}":
    ensure  => file,
    owner   => 'root',
    group   => $rd_group,
    mode    => '0440',
    content => template("rundeck/${login_config}.erb"),
   }

  file { "${rd_home}/${realm_property}":
    ensure  => file,
    owner   => 'root',
    group   => $rd_group,
    mode    => '0440',
    content => template("rundeck/${realm_property}.erb"),
  }

  file { "${rd_home}/${framework_property}":
    ensure  => file,
    owner   => 'root',
    group   => $rd_group,
    mode    => '0440',
    content => template("rundeck/${framework_property}.erb"),
  }
   
  file { "${rd_home}/${project_property}":
    ensure  => file,
    owner   => 'root',
    group   => $rd_group,
    mode    => '0440',
    content => template("rundeck/${project_property}.erb"),
  }
   
  file { "${rd_home}/${rd_config_property}":
    ensure  => file,
    owner   => 'root',
    group   => $rd_group,
    mode    => '0440',
    content => template("rundeck/${rd_config_property}.erb"),
  }
   
  file { "${rd_home}/${log4j_property}":
    ensure  => file,
    owner   => 'root',
    group   => $rd_group,
    mode    => '0440',
    content => template("rundeck/${log4j_property}.erb"),
  }
   
   
   
  if $aide {
    aide::directive { "exclude_rundeck_${rd_base}_logs":
      content => "!${rd_base}/logs"
    }
    aide::directive { "exclude_rundeck_${rd_base}_tmp":
      content => "!${rd_base}/tmp"
    }
  }
}
