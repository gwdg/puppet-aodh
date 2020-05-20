# == Class: aodh::db::postgresql
#
# Class that configures postgresql for aodh
# Requires the Puppetlabs postgresql module.
#
# === Parameters
#
# [*password*]
#   (Required) Password to connect to the database.
#
# [*dbname*]
#   (Optional) Name of the database.
#   Defaults to 'aodh'.
#
# [*user*]
#   (Optional) User to connect to the database.
#   Defaults to 'aodh'.
#
#  [*encoding*]
#    (Optional) The charset to use for the database.
#    Default to undef.
#
#  [*privileges*]
#    (Optional) Privileges given to the database user.
#    Default to 'ALL'
#
class aodh::db::postgresql(
  $password,
  $dbname     = 'aodh',
  $user       = 'aodh',
  $encoding   = undef,
  $privileges = 'ALL',
) {

  include aodh::deps

  openstacklib::db::postgresql { 'aodh':
    password   => $password,
    dbname     => $dbname,
    user       => $user,
    encoding   => $encoding,
    privileges => $privileges,
  }

  Anchor['aodh::db::begin']
  ~> Class['aodh::db::postgresql']
  ~> Anchor['aodh::db::end']

}
