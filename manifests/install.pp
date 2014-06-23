# Class: rundeck::install
#
# This class installs rundeck
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
class rundeck::install {

  package { $rundeck::package:
    ensure  => $rundeck::manage_package,
    noop    => $rundeck::noops,
  }
}
