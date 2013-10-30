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

class cron(
  $job    => 'NONE',
  $daily  => 'NONE',
  $weekly => 'NONE',
  $monthly => 'NONE',
  hourly   => 'NONE',
) {
  include cron::install

  if $job != 'NONE' {
    create_resources('cron::job', $job)
  }

  if $daily != 'NONE' {
    create_resources('cron::daily', $daily)
  }

  if $weekly != 'NONE' {
    create_resources('cron::weekly', $weekly)
  }

  if $monthly != 'NONE' {
    create_resources('cron::monthly', $monthly)
  }

  if $hourly != 'NONE' {
    create_resources('cron::hourly', $hourly)
  }
}

