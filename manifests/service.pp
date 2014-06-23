# Class: rundeck::service
#
# This class manages rundeck service
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
class rundeck::service {

  service { 'rundeck':
    ensure     => $rundeck::manage_service_ensure,
    name       => $rundeck::service,
    enable     => $rundeck::manage_service_enable,
    hasstatus  => $rundeck::service_status,
    pattern    => $rundeck::process,
    noop       => $rundeck::noops,
  }
}
