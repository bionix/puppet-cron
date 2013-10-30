# Class: cron
#
# This class wraps *cron::instalL* for ease of use
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#   include 'cron'
#   class { 'cron': }

class cron {
  include cron::install
$network_if_statics = hiera_hash('network::if::static',undef)

  $job = hiera_hash('cron::job',undef)
  if $job != undef {
    create_resources('cron::job', $job)
  }

  if $daily != undef {
    create_resources('cron::daily', $daily)
  }

  if $weekly != undef {
    create_resources('cron::weekly', $weekly)
  }

  if $monthly != undef {
    create_resources('cron::monthly', $monthly)
  }

  if $hourly != undef {
    create_resources('cron::hourly', $hourly)
  }
}

