# Class: sysctl::base
#
# Common part for the sysctl definition. Not meant to be used on its own.
#
class sysctl::base (
  $purge = false,
) {

  include ::sysctl::params
  $sysctl_location = $::sysctl::params::sysctl_location
  $ensure          = $::sysctl::params::ensure
  $group           = $::systcl::params::group
  $mode            = $::sysctl::params::mode

  if $purge {
    $recurse = true
  } else {
    $recurse = false
  }

  file { $sysctl_location:
    ensure  => $ensure,
    owner   => 'root',
    group   => $group,
    mode    => $mode,
    # Magic hidden here
    purge   => $purge,
    recurse => $recurse,
  }

}

