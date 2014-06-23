# Class rundeck::postgresql
#
# Configures PostGreSQL grants for Rundeck
#
class rundeck::postgresql {

  case $rundeck::db_host {
    '', 'localhost','127.0.0.1': {
      postgresql::dbcreate { $rundeck::db_name:
        role     => $rundeck::db_user,
        password => $rundeck::db_password,
        address  => '127.0.0.1/32',
      }
    }
    default: {
      @@postgresql::dbcreate { $rundeck::db_name:
        role     => $rundeck::db_user,
        password => $rundeck::db_password,
        address  => $::ipaddress,
        tag      => "postgresql_grants_${rundeck::db_host}",
      }
    }
  }
}
